from rest_framework import status
from rest_framework.parsers import JSONParser
from rest_framework.response import Response
from rest_framework.views import APIView

from account.models import User
from api.authen import API_KEY
from cart.models import Cart
from coupon import coupon_logic
from mainapp.models import DetailShoe, Shoe
from order import order_logic


class PlaceAnOrder(APIView):
    """
    data = {
        "key": API_KEY,
        "coupon_id": coupon_id
    }
    """

    def post(self, request):
        data = JSONParser().parse(request)
        if data.get('key') != API_KEY:
            return Response(status=status.HTTP_403_FORBIDDEN)

        messenger_id = data.get('messengerId')
        coupon_id = data.get('coupon_id')
        coupon = coupon_logic.get_coupon_available_by_id(coupon_id)

        user = User.objects.filter(messengerId=messenger_id).first()
        if not user:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        data = {'detail_shoes_id': [],
                # 'is_buy_87': ['on'],
                # 'qt_87': ['3'],
                # 'is_buy_89': ['on'],
                # 'qt_89': ['1'],
                'coupon_code': [coupon.couponCode if coupon else ''],
                'receiver': [user.displayName],
                'phone': [user.phone],
                'address': [user.defaultAddress], }

        carts = Cart.objects.filter(user_id=user.id)
        shoes = Shoe.objects.filter(detailshoe__cart__user_id=user.id)

        for detail_shoe in DetailShoe.objects.filter(cart__user_id=user.id):
            cart = carts.filter(detailShoe_id=detail_shoe.id).first()
            shoe = shoes.filter(id=detail_shoe.shoe_id).first()
            if detail_shoe.quantityAvailable >= cart.quantityOnCart and shoe.active:
                data['detail_shoes_id'].append(str(detail_shoe.id))
                data[f'is_buy_{detail_shoe.id}'] = ['on']
                data[f'qt_{detail_shoe.id}'] = [str(cart.quantityOnCart)]
        context = order_logic.place_an_order(data, user)

        if context.get('is_success'):
            return Response(status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
