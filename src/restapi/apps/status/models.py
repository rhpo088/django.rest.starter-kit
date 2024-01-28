from django.db import models


class Status(models.Model):  # COMM0N
    name = models.CharField(max_length=100)

    class Meta:
        abstract = True
