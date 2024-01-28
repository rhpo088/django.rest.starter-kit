"""
The root URLconf of Status API.
"""

from django.urls import path

from restapi.apps.status.apps import StatusAppConfig
from restapi.apps.status.views import RetrieveStatusApiView

app_name = StatusAppConfig.verbose_name
urlpatterns = [
    path("", RetrieveStatusApiView.as_view(), name="retrieve"),
]
