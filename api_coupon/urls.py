from django.urls import path
from .views import GetAllCouponsAvailable, GetCouponInfo

app_name = 'api_coupon'

urlpatterns = [
    # endpoint /api/api_coupon/get_all_coupons_available/
    path('get_all_coupons_available/', GetAllCouponsAvailable.as_view()),

    # endpoint /api/api_coupon/get_coupon_info/
    path('get_coupon_info/', GetCouponInfo.as_view()),
]
