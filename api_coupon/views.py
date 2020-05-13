from rest_framework import status
from rest_framework.parsers import JSONParser
from rest_framework.response import Response
from rest_framework.views import APIView

from api_coupon.serializers import CouponSerializer
from coupon import coupon_logic


class GetAllCouponsAvailable(APIView):
    def get(self, request):
        coupons = coupon_logic.get_all_coupons_available()
        coupons_serializer = CouponSerializer(coupons, many=True)
        return Response(data=coupons_serializer.data, status=status.HTTP_200_OK)


class GetCouponInfo(APIView):
    def post(self, request):
        data = JSONParser().parse(request)
        print(data)
        coupon_id = data.get('coupon_id')
        coupon_code = data.get('coupon_code')
        if coupon_id:
            coupon = coupon_logic.get_coupon_available_by_id(coupon_id)
        else:
            coupon = coupon_logic.get_coupon_available(coupon_code)

        if coupon:
            coupon_serializer = CouponSerializer(coupon)
            return Response(data=coupon_serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
