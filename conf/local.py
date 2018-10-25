# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import os
from settings_base import *

DEBUG = TEMPLATE_DEBUG = True

ALLOWED_HOSTS = ['YNH_APP_ARG_DOMAIN']

URL_PREFIX = 'YNH_APP_PREFIX'
STATIC_ROOT = 'YNH_APP_STATIC_ROOT'
NOTIFICATION_EMAILS = ['YNH_APP_ARG_EMAIL']
DEFAULT_FROM_EMAIL = 'notifier@YNH_APP_ARG_DOMAIN'
SITE_URL = "https://YNH_APP_ARG_DOMAINYNH_APP_ARG_PATH"
SECRET_KEY = 'YNH_APP_SECRET_KEY'
ISP = {
    'NAME' : 'YNH_APP_ARG_ISP_NAME',
    'SITE' : 'YNH_APP_ARG_ISP_SITE',
    'EMAIL' : 'YNH_APP_ARG_EMAIL',
}
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'YNH_DB_NAME',
        'USER': 'YNH_DB_USER',
        'PASSWORD': 'YNH_DB_PASSWORD',
        'HOST': '',  # Empty for localhost through domain sockets
        'PORT': '',  # Empty for default
    },
}

FEEDS = (('isp', 'http://www.illyse.net/feed/', 3),
         ('ffdn', 'http://www.ffdn.org/fr/rss.xml', 3))





















# Tous accés
# paramétrer SSO en protect_uris
# OU
# Pas d'accès
# hook
# paramétrer SSO en protect_uris
import ldap
from django_auth_ldap.config import LDAPSearch, PosixGroupType
AUTHENTICATION_BACKENDS = (
    'django_auth_ldap.backend.LDAPBackend',
    'django.contrib.auth.backends.ModelBackend',
)
AUTH_LDAP_SERVER_URI = "ldap://localhost:389"
AUTH_LDAP_USER_SEARCH = LDAPSearch("uid=YNH_APP_ARG_ADMIN,ou=users,dc=yunohost,dc=org", ldap.SCOPE_SUBTREE, "(uid=%(user)s)")
AUTH_LDAP_USER_FLAGS_BY_GROUP = {
    "is_active": "cn=sftpusers,ou=groups,dc=yunohost,dc=org",
    "is_staff": "cn=sftpusers,ou=groups,dc=yunohost,dc=org",
    "is_superuser": "cn=sftpusers,ou=groups,dc=yunohost,dc=org"
}
AUTH_LDAP_GROUP_SEARCH = LDAPSearch("ou=groups,dc=yunohost,dc=org", ldap.SCOPE_SUBTREE, "(objectClass=posixGroup)")
AUTH_LDAP_GROUP_TYPE = PosixGroupType()
AUTH_LDAP_ALWAYS_UPDATE_USER = True
AUTH_LDAP_AUTHORIZE_ALL_USERS = True
AUTH_LDAP_FIND_GROUP_PERMS = True
#AUTH_LDAP_CACHE_GROUPS = True
#AUTH_LDAP_GROUP_CACHE_TIMEOUT = 300
#import logging
#logger = logging.getLogger('django_auth_ldap')
#logger.addHandler(logging.StreamHandler())
#logger.setLevel(logging.DEBUG)
