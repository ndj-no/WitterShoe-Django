from .models import Coupon
from django.utils import timezone


def get_default_coupon():
    """
    tra ve id coupon mac dinh. k co giam gia j het
    :return:
    """
    coupon = Coupon.objects.filter(discountAmount=0, discountRate=0).first()
    if coupon:
        return coupon
    else:
        coupon = Coupon(discountAmount=0, discountRate=0, couponTitle='Default Coupon', couponCode='DEFAULT')
        coupon.save()
        return coupon


def get_coupon_available(coupon_code):
    coupon = Coupon.objects.filter(couponCode=coupon_code).filter(expirationDate__gte=timezone.now()).first()
    return coupon


def reduce_price(price, coupon_id):
    coupon = Coupon.objects.get(pk=coupon_id)
    discountAmount = coupon.discountAmount
    discountRate = coupon.discountRate

    total_discount = int((discountAmount + (price - discountAmount) * discountRate / 100))
    final_price = price - total_discount
    return final_price
