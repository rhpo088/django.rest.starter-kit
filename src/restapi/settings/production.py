"""
Django settings for ESP Web Portal API project.

These settings are used in production mode.
"""

from restapi.settings.base import *  # noqa: F401,F403

DEBUG = False

WSGI_APPLICATION = "restapi.wsgi.application"
