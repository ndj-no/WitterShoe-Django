from django.urls import path
from .views import GetAllCouponsAvailable, GetCouponInfo

app_name = 'api_coupon'

urlpatterns = [
    path('get_all_coupons_available/', GetAllCouponsAvailable.as_view()),
    path('get_coupon_info/', GetCouponInfo.as_view()),
]
