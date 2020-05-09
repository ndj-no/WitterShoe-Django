from django.http import HttpResponse

from django.views.decorators.csrf import csrf_exempt
from rest_framework import status
from rest_framework.parsers import JSONParser

from account.models import User
from api_for_bot.serializers import UserSerializer
from cart.models import Cart
from mainapp.models import DetailShoe
from .authen import API_KEY


@csrf_exempt
def register_messenger_user(request):
    """
    tạo user dựa trên messenger id. messenger id được gán duy nhất tại đây nếu nó chưa tồn tại
    :param request:
    :return:
    """
    if request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = UserSerializer(data=data)
        if data['key'] != API_KEY:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)
        if serializer.is_valid() and not serializer.is_exists():
            serializer.save()
            return HttpResponse(status=status.HTTP_201_CREATED)
        return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
    else:
        return HttpResponse(status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def add_to_cart(request):
    """
    Them hang vao cart, neu ton tai thi update so luong
    :param request:
    :return:
    """
    if request.method == 'POST':
        data = JSONParser().parse(request)
        user_id = data.get('user_id')
        shoe_id = data.get('shoe_id')
        color_id = data.get('color_id')
        size = data.get('size')

        if data['key'] != API_KEY:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)
        elif not user_id or not color_id or not size:
            return HttpResponse(status=status.HTTP_400_BAD_REQUEST)

        user = User.objects.filter(id=user_id).first()
        detail_shoe = DetailShoe.objects.filter(shoe_id=shoe_id, color_id=color_id, size=size).first()
        cart = Cart.objects.filter(user=user, detailShoe=detail_shoe).first()
        print(user)
        print(detail_shoe)
        print(cart)
        if cart is None and user and detail_shoe:
            cart = Cart(user=user, detailShoe=detail_shoe, quantityOnCart=1)
            cart.save()
        elif cart is not None:
            cart.quantityOnCart = cart.quantityOnCart + 1
            cart.save()
        else:
            return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
        return HttpResponse(status=status.HTTP_201_CREATED)
    else:
        return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
