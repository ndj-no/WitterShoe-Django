from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework import status
from rest_framework.parsers import JSONParser

from account.models import User
from api.authen import API_KEY
from cart.models import Cart
from mainapp.models import DetailShoe


@csrf_exempt
def add_to_cart(request):
    """
    example
    {
        "user_id": 33,
        "shoe_id": "9",
        "color_id": "2",
        "size": "43",
        "key": "123@abc"
    }
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

        # authenticate
        if data['key'] != API_KEY:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)
        elif not user_id or not color_id or not size:
            return HttpResponse(status=status.HTTP_400_BAD_REQUEST)

        user = User.objects.filter(id=user_id).first()
        detail_shoe = DetailShoe.objects.filter(shoe_id=shoe_id, color_id=color_id, size=size).first()
        cart = Cart.objects.filter(user=user, detailShoe=detail_shoe).first()
        print('add_to_cart api')
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
