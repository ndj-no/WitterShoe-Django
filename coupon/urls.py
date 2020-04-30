from django.urls import path
from .views import *

app_name = 'coupon'

urlpatterns = [
    path('', CouponView.as_view(), name='coupon_url'),
]
