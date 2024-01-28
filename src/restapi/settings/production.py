"""
Django settings for ESP Web Portal API project.

These settings are used in production mode.
"""

# pylint: disable=wildcard-import,unused-wildcard-import
from restapi.settings.base import *

DEBUG = False

WSGI_APPLICATION = "restapi.wsgi.application"
