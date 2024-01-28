"""
The test cases of a Status application.
"""

from django.test import TestCase
from django.test.client import RequestFactory
from django.urls import reverse
from rest_framework import status
from rest_framework.response import Response

from restapi.apps.status.views import RetrieveStatusApiView


class TestRetrieveStatusApiView(TestCase):
    """
    The test case of a view to retrieve a status of API.
    """

    @classmethod
    def setUpClass(cls):
        """
        Setting up class fixture before running tests in the class.
        """

        super().setUpClass()

        cls._factory = RequestFactory()
        cls._url = reverse("restapi:status:retrieve")
        cls._request = cls._factory.get(cls._url)

    def test_retrieve_ok(self):
        """
        A test of a request `GET /api/status`
        """
        response: Response = RetrieveStatusApiView.as_view()(self._request)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
