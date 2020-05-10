from django.http import HttpResponse

from django.views.decorators.csrf import csrf_exempt
from rest_framework import status
from rest_framework.parsers import JSONParser
from rest_framework.response import Response
from rest_framework.views import APIView

from account.models import User
from api.authen import API_KEY
from api_account.serializers import UserMessengerSerializer, UserInfoSerializer


@csrf_exempt
def register_messenger_user(request):
    """
    tạo user dựa trên messenger id. messenger id được gán duy nhất tại đây nếu nó chưa tồn tại

    example post data
    {
        "messengerId": 9876,
        "displayName": "messenger user",
        "key": API_KEY
    }

    :param request:
    :return:
    """
    if request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = UserMessengerSerializer(data=data)
        if data['key'] != API_KEY:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)
        if serializer.is_valid() and not serializer.is_exists():
            serializer.save()
            return HttpResponse(status=status.HTTP_201_CREATED)
        return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
    else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)


class GetUserInfoApiView(APIView):
    def post(self, request):
        """
        Trả về user info để giao hàng

        :param request:
        :return:
        """
        data = JSONParser().parse(request)
        if data.get('key') != API_KEY:
            return Response(status=status.HTTP_403_FORBIDDEN)
        messenger_id = data.get('messengerId')
        user = User.objects.filter(messengerId=messenger_id).first()
        if user:
            user_info = UserInfoSerializer(user)
            return Response(data=user_info.data, status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
