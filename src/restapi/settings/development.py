"""
Django settings for restapi project.

These settings are used in development mode.
"""

from restapi.settings.base import *  # noqa: F403

INSTALLED_APPS += [  # noqa: F405
    "django_extensions",
]

ALLOWED_HOSTS.append("testserver")  # noqa: F405
