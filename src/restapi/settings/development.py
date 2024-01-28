"""
Django settings for restapi project.

These settings are used in development mode.
"""

# pylint: disable=wildcard-import,unused-wildcard-import
from restapi.settings.base import *

INSTALLED_APPS += [
    "django_extensions",
]

ALLOWED_HOSTS.append("testserver")
