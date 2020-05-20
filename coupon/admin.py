from django.contrib import admin
from .models import Coupon


class CouponAdmin(admin.ModelAdmin):
    list_display = ['id', 'couponTitle', 'couponCode', 'expirationDate', 'discountRate', 'couponAmount']
    list_display_links = ['couponTitle', 'couponCode']

    list_per_page = 30


admin.site.register(Coupon, CouponAdmin)
