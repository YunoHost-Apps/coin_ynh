
function install_dependencies()
{
    # Dependencies
    ynh_install_app_dependencies gunicorn python-dev python-pip libldap2-dev libpq-dev libsasl2-dev libjpeg-dev libxml2-dev libxslt1-dev libffi-dev python-cairo libpango1.0-0 postgresql postgresql-contrib #libmysqlclient-dev 
}

function init_db()
{
    ynh_psql_test_if_first_run
    # Generate random password
    db_name=$app
    db_user=$app
    db_pwd=$(ynh_string_random)
    # Initialize database and store pssql password for upgrade
    ynh_psql_create_db $db_name $db_user $db_pwd
    ynh_app_setting_set "$app" psqlpassword "$db_pwd"
}
