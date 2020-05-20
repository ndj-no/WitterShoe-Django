from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone

from account.models import User
from coupon.models import Coupon


class Color(models.Model):
    colorName = models.CharField(max_length=64)
    colorDesc = models.CharField(max_length=128, default='', blank=True)

    def __str__(self):
        return '[{}] Màu: {}'.format(self.id, self.colorName)


class Category(models.Model):
    categoryName = models.CharField(max_length=128)
    categoryThumbnail = models.CharField(max_length=255, default='')
    categoryDesc = models.CharField(max_length=255, default='', blank=True)

    def __str__(self):
        return '[{}] {}'.format(self.id, self.categoryName)


class Brand(models.Model):
    brandName = models.CharField(max_length=128)
    brandDesc = models.CharField(max_length=1024, default='', blank=True)

    def __str__(self):
        return '[{}] Hiệu: {}'.format(self.id, self.brandName)


class Shoe(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    shoeName = models.CharField(max_length=255)
    shoeModel = models.CharField(max_length=255, blank=True)
    shoeThumbnail = models.ImageField(upload_to='shoe_thumbnails', blank=True)
    image_static = models.CharField(max_length=255, default='', blank=True)
    active = models.IntegerField(choices=((0, 'Inactive'), (1, 'Active')), default=0)
    quantitySold = models.IntegerField(default=0)
    viewCount = models.IntegerField(default=0)
    favouriteCount = models.IntegerField(default=0)
    dateCreated = models.DateTimeField(default=timezone.now)
    dateModified = models.DateTimeField(auto_now=True)
    shoeDesc = models.CharField(max_length=2048, default='', blank=True)

    def __str__(self):
        return '[{}] {} - {}'.format(self.id, self.shoeModel, self.shoeName)


class Image(models.Model):
    shoe = models.ForeignKey(Shoe, on_delete=models.CASCADE)
    shoeImage = models.ImageField(upload_to='shoe_images', blank=True)
    imageDesc = models.CharField(max_length=64, default='', blank=True)

    def __str__(self):
        return '[{}] Shoe: {} - Image: {}' \
            .format(self.id, self.shoe.shoeName, self.shoeImage.name)


class DetailShoe(models.Model):
    shoe = models.ForeignKey(Shoe, on_delete=models.CASCADE)
    color = models.ForeignKey(Color, on_delete=models.CASCADE)
    size = models.IntegerField(default=40)
    quantityAvailable = models.IntegerField(default=0)
    oldPrice = models.IntegerField(default=0)
    newPrice = models.IntegerField(default=0)
    detailShoeDesc = models.CharField(max_length=255, default='', blank=True)

    def __str__(self):
        return '[{}] Model: {} - Size: {} - Màu: {} - Giá cũ: {} - Giá mới: {}' \
            .format(self.id, self.shoe.shoeModel, self.size, self.color.colorName, self.oldPrice, self.newPrice)
