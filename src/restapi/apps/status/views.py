from rest_framework.generics import RetrieveAPIView
from rest_framework.response import Response


class RetrieveStatusApiView(RetrieveAPIView):
    def retrieve(self, request, *args, **kwargs):
        return Response({"status": "200 OK"})
