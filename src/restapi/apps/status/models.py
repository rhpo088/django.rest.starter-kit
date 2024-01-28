"""
The models of a Status application.
"""

from django.db import models


class Status(models.Model):
    """
    Abstract `Status` model
    """

    name = models.CharField(max_length=100)

    class Meta:
        abstract = True
