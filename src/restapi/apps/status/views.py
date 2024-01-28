"""
Views of `status` application.
"""

from rest_framework.generics import RetrieveAPIView
from rest_framework.response import Response


class RetrieveStatusApiView(RetrieveAPIView):
    """
    A view to retrieve a status of API
    """

    def retrieve(self, request, *args, **kwargs):
        """
        A handler of GET request to retrieve the status.
        """
        return Response({"status": "200 OK"})
