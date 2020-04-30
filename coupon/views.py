from django.shortcuts import render
from mainapp.views import MainFrameView
from .models import Coupon
from django.utils import timezone


# Create your views here.
class CouponView(MainFrameView):
    def get(self, request):
        self.update_top_bar(request)
        coupons = Coupon.objects.filter(expirationDate__gte=timezone.now())
        for coupon in coupons:
            print(coupon)
        context = {
            'coupons': coupons,
        }
        self.context.update(context)
        return render(request, 'coupon/coupon.html', self.context)
