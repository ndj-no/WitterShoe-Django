from django.db import models
from django.utils import timezone


# Create your models here.

class Coupon(models.Model):
    couponImage = models.ImageField(upload_to='coupon_images', blank=True)
    couponTitle = models.CharField(max_length=64)
    couponCode = models.CharField(max_length=32, unique=True, null=False)
    expirationDate = models.DateField(default=timezone.now)
    discountRate = models.IntegerField(default=0)
    discountAmount = models.IntegerField(default=0)
    couponAmount = models.IntegerField(default=50)
    couponDescription = models.TextField(max_length=255, default='', blank=True)

    def __str__(self):
        return 'id({}) _ title({}) _ code({}) _ date({}) _ rate({} %) _ amount({} đ)'.format(self.id, self.couponTitle,
                                                                                             self.couponCode,
                                                                                             self.expirationDate,
                                                                                             self.discountRate,
                                                                                             self.discountAmount)
