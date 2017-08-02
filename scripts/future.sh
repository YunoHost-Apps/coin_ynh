
log() {
  echo "${1}"
}

info() {
  log "[INFO] ${1}"
}

warn() {
  log "[WARN] ${1}"
}

err() {
  log "[ERR] ${1}"
}


#======================================================================
# data/helpers.d/package
#======================================================================

# Define and install dependencies with a equivs control file
# This helper can/should only be called once per app
#
# usage: ynh_install_app_dependencies dep [dep [...]]
# | arg: dep - the package name to install in dependence
ynh_install_app_dependencies () {
    local old_dir=$(pwd)
    dependencies=$@
    manifest_path="../manifest.json"
    if [ ! -e "$manifest_path" ]; then
        manifest_path="../settings/manifest.json"   # Into the restore script, the manifest is not at the same place
    fi
    local version=$(sudo python3 -c "import sys, json;print(json.load(open(\"$manifest_path\"))['version'])") # Retrieve the version number in the manifest file.
    dep_app=${app//_/-} # Replace all '_' by '-'

    if ynh_package_is_installed "${dep_app}-ynh-deps"; then
        echo "A package named ${dep_app}-ynh-deps is already installed" >&2
    else
        cat > ./${dep_app}-ynh-deps.control << EOF  # Make a control file for equivs-build
Section: misc
Priority: optional
Package: ${dep_app}-ynh-deps
Version: ${version}
Depends: ${dependencies// /, }
Architecture: all
Description: Fake package for ${app} (YunoHost app) dependencies
 This meta-package is only responsible of installing its dependencies.
EOF
        ynh_package_install_from_equivs ./${dep_app}-ynh-deps.control \
            || ynh_die "Unable to install dependencies" # Install the fake package and its dependencies
        ynh_app_setting_set $app apt_dependencies $dependencies
    fi
    cd $old_dir
}

# Remove fake package and its dependencies
#
# Dependencies will removed only if no other package need them.
#
# usage: ynh_remove_app_dependencies
ynh_remove_app_dependencies () {
    dep_app=${app//_/-} # Replace all '_' by '-'
    ynh_package_autoremove ${dep_app}-ynh-deps  # Remove the fake package and its dependencies if they not still used.
}

#=====================================================================
# data/helpers.d/filesystem
#=====================================================================

# Remove a file or a directory securely
#
# usage: ynh_secure_remove path_to_remove
# | arg: path_to_remove - File or directory to remove
ynh_secure_remove () {
    path_to_remove=$1
    forbidden_path=" \
    /var/www \
    /home/yunohost.app"

    if [[ "$forbidden_path" =~ "$path_to_remove" \
        # Match all paths or subpaths in $forbidden_path
        || "$path_to_remove" =~ ^/[[:alnum:]]+$ \
        # Match all first level paths from / (Like /var, /root, etc...)
        || "${path_to_remove:${#path_to_remove}-1}" = "/" ]]
        # Match if the path finishes by /. Because it seems there is an empty variable
    then
        echo "Avoid deleting $path_to_remove." >&2
    else
        if [ -e "$path_to_remove" ]
        then
            sudo rm -R "$path_to_remove"
        else
            echo "$path_to_remove wasn't deleted because it doesn't exist." >&2
        fi
    fi
}

#=====================================================================
# data/helpers.d/utils
#=====================================================================

# Download and uncompress the source from app.src
#
# The file conf/app.src need to contains:
# 
# SOURCE_URL=Address to download the app archive
# SOURCE_SUM=Control sum
# SOURCE_FORMAT=tar.gz # (Optional) default value: tar.gz
# SOURCE_IN_SUBDIR=false # (Optional) Put false if source are directly in the archive root
# SOURCE_FILENAME="example.tar.gz" (Optionnal) default value: ${src_id}.${src_format}
#
#
# usage: ynh_setup_source dest_dir [source_id]
# | arg: dest_dir  - Directory where to setup sources
# | arg: source_id - Name of the app, if the package contains more than one app
ynh_setup_source () {
    local dest_dir=$1
    local src_id=${2:-app} # If the argument is not given, source_id equal "app"
    # Load value from configuration file (see above for a small doc about this file
    # format)
    local src_url=$(grep 'SOURCE_URL=' "../conf/${src_id}.src" | cut -d= -f2-)
    local src_sum=$(grep 'SOURCE_SUM=' "../conf/${src_id}.src" | cut -d= -f2-)
    local src_sumprg=$(grep 'SOURCE_SUM_PRG=' "../conf/${src_id}.src" | cut -d= -f2-)
    local src_format=$(grep 'SOURCE_FORMAT=' "../conf/${src_id}.src" | cut -d= -f2-)
    local src_in_subdir=$(grep 'SOURCE_IN_SUBDIR=' "../conf/${src_id}.src" | cut -d= -f2-)
    local src_filename=$(grep 'SOURCE_FILENAME=' "../conf/${src_id}.src" | cut -d= -f2-)
    
    # Default value
    src_sumprg=${src_sumprg:-sha256sum}
    src_in_subdir=${src_in_subdir:-true}
    src_format=$(echo "$src_format" | tr '[:upper:]' '[:lower:]')
    if [ "$src_filename" = "" ] ; then
        src_filename="${src_id}.${src_format}"
    fi
    local local_src="/opt/yunohost-apps-src/${YNH_APP_ID}/${src_filename}"

    if test -e "$local_src"
    then    # Use the local source file if it is present
        cp $local_src $src_filename
    else    # If not, download the source
        wget -nv -O $src_filename $src_url
    fi

    # Check the control sum
    echo "${src_sum} ${src_filename}" | ${src_sumprg} -c --status \
        || ynh_die "Corrupt source"

    # Extract source into the app dir
    sudo mkdir -p "$dest_dir"
    if [ "$src_format" = "zip" ]
    then # Zip format
        # Using of a temp directory, because unzip doesn't manage --strip-components
        if $src_in_subdir ; then
            local tmp_dir=$(mktemp -d)
            unzip -quo $src_filename -d "$tmp_dir"
            sudo cp -a $tmp_dir/*/. "$dest_dir"
            ynh_secure_remove "$tmp_dir"
        else
            unzip -quo $src_filename -d "$dest_dir"
        fi
    else
        local strip=""
        if $src_in_subdir ; then
            strip="--strip-components 1"
        fi
        if [[ "$src_format" =~ ^tar.gz|tar.bz2|tar.xz$ ]] ; then
            sudo tar -xf $src_filename -C "$dest_dir" $strip
        else
            ynh_die "Archive format unrecognized."
        fi
    fi

    # Apply patches
    if (( $(find ../sources/patches/ -type f -name "${src_id}-*.patch" 2> /dev/null | wc -l) > "0" )); then
        local old_dir=$(pwd)
        (cd "$dest_dir" \
            && for p in $old_dir/../sources/patches/${src_id}-*.patch; do \
                sudo patch -p1 < $p; done) \
            || ynh_die "Unable to apply patches"
        cd $old_dir
    fi

    # Add supplementary files
    if test -e "../sources/extra_files"; then
        sudo cp -a ../sources/extra_files/. "$dest_dir"
    fi

}

ynh_exit_properly () {  
    exit_code=$?
    if [ "$exit_code" -eq 0 ]; then
            exit 0  
    fi
    trap '' EXIT
    set +eu
    echo -e "\e[91m \e[1m"  
    err "$app script has encountered an error."

    if type -t CLEAN_SETUP > /dev/null; then
        CLEAN_SETUP
    fi

    ynh_die
}

# Activate signal capture
# Exit if a command fail, and if a variable is used unset.
# Capturing exit signals on shell script
#
# example: CLEAN_SETUP () {
#             # Clean residual file un remove by remove script
#          }
#          ynh_trap_on
ynh_trap_on () {
    set -eu
    trap ynh_exit_properly EXIT # Capturing exit signals on shell script
}

ynh_read_json () {
    sudo python3 -c "import sys, json;print(json.load(open('$1'))['$2'])"
}

ynh_read_manifest () {
    if [ -f '../manifest.json' ] ; then
        ynh_read_json '../manifest.json' "$1"
    else
        ynh_read_json '../settings/manifest.json' "$1"
    fi
}

ynh_exit_if_up_to_date () {
    if [ "${version}" = "${last_version}" ]; then
        info "Up-to-date, nothing to do"
        exit 0
    fi
}

# Open a connection as a user
#
# example: ynh_psql_connect_as 'user' 'pass' <<< "UPDATE ...;"
# example: ynh_psql_connect_as 'user' 'pass' < /path/to/file.sql
#
# usage: ynh_psql_connect_as user pwd [db]
# | arg: user - the user name to connect as
# | arg: pwd - the user password
# | arg: db - the database to connect to
ynh_psql_connect_as() {
    ynh_die "ynh_psql_connect_as is not yet implemented"
}

# # Execute a command as root user
#
# usage: ynh_psql_execute_as_root sql [db]
# | arg: sql - the SQL command to execute
# | arg: db - the database to connect to
ynh_psql_execute_as_root () {
        sudo su -c "psql" - postgres <<< ${1}
}

# Execute a command from a file as root user
#
# usage: ynh_psql_execute_file_as_root file [db]
# | arg: file - the file containing SQL commands
# | arg: db - the database to connect to
ynh_psql_execute_file_as_root() {
     ynh_die "ynh_psql_execute_file_as_root is not yet implemented"
}

# Create a database and grant optionnaly privilegies to a user
#
# usage: ynh_psql_create_db db [user [pwd]]
# | arg: db - the database name to create
# | arg: user - the user to grant privilegies
# | arg: pwd - the password to identify user by
ynh_psql_create_db() {
    db=$1
    # grant all privilegies to user
    if [[ $# -gt 1 ]]; then
        ynh_psql_create_user ${2} "${3}"
        sudo su -c "createdb -O ${2} $db" -  postgres
    else
        sudo su -c "createdb $db" -  postgres
    fi

}

# Drop a database
#
# usage: ynh_psql_drop_db db
# | arg: db - the database name to drop
ynh_psql_drop_db() {
    sudo su -c "dropdb ${1}" -  postgres
}

# Dump a database
#
# example: ynh_psql_dump_db 'roundcube' > ./dump.sql
#
# usage: ynh_psql_dump_db db
# | arg: db - the database name to dump
# | ret: the psqldump output
ynh_psql_dump_db() {
    ynh_die "ynh_psql_dump_db is not yet implemented"
}


# Create a user
#
# usage: ynh_psql_create_user user pwd [host]
# | arg: user - the user name to create
# | arg: pwd - the password to identify user by
ynh_psql_create_user() {
        ynh_psql_execute_as_root \
        "CREATE USER ${1} WITH PASSWORD '${2}';"
}

# Drop a user
#
# usage: ynh_psql_drop_user user
# | arg: user - the user name to drop
ynh_psql_drop_user() {
    sudo su -c "dropuser ${1}" - postgres
}
