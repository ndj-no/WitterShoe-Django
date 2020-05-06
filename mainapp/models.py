from django.db import models
from django.utils import timezone
from django.contrib.auth.models import AbstractUser
from account.models import User
from coupon.models import Coupon


# Create your models here.

class Color(models.Model):
    colorName = models.CharField(max_length=64)
    colorDesc = models.CharField(max_length=128, default='', blank=True)

    def __str__(self):
        return 'Color( id:{:<3}_ colorName:{:<10}_ colorDesc:{:<10} )'.format(self.id, self.colorName, self.colorDesc)


class Category(models.Model):
    categoryName = models.CharField(max_length=128)
    categoryThumbnail = models.CharField(max_length=255, default='')
    categoryDesc = models.CharField(max_length=255, default='', blank=True)

    def __str__(self):
        return 'Category( id:{}_ name:{}_ thumbnail:{}_ description:{} )'.format(self.id, self.categoryName,
                                                                                 self.categoryThumbnail,
                                                                                 self.categoryDesc)


class Brand(models.Model):
    brandName = models.CharField(max_length=128)
    brandDesc = models.CharField(max_length=1024, default='', blank=True)

    def __str__(self):
        return 'Brand( id:{} _ name:{} _ desc:{} )'.format(self.id, self.brandName, self.brandDesc)


class Shoe(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    shoeName = models.CharField(max_length=255)
    shoeModel = models.CharField(max_length=255, blank=True)
    shoeThumbnail = models.ImageField(upload_to='shoe_thumbnails', blank=True)
    active = models.IntegerField(choices=((0, 'Inactive'), (1, 'Active')), default=0)
    quantitySold = models.IntegerField(default=0)
    viewCount = models.IntegerField(default=0)
    favouriteCount = models.IntegerField(default=0)
    dateCreated = models.DateTimeField(default=timezone.now)
    shoeDesc = models.CharField(max_length=2048, default='', blank=True)

    def __str__(self):
        return 'Shoe( id:{:<3}_ name:{:<30}_ category:{:<30} _ quantitySold:{:<5}_ view:{:<4}_ ' \
               'favourite:{:<4} )'.format(self.id, self.shoeName, self.category.categoryName, self.quantitySold,
                                          self.viewCount, self.favouriteCount)


class Image(models.Model):
    shoe = models.ForeignKey(Shoe, on_delete=models.CASCADE)
    # imageName = models.CharField(max_length=255)
    shoeImage = models.ImageField(upload_to='shoe_images', blank=True)
    imageDesc = models.CharField(max_length=64, default='', blank=True)

    def __str__(self):
        return 'Image( id:{:<3}_ shoeName:{:<30}_ imageName:{:<15} )' \
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
        return 'DetailShoe( id:{} _ shoeName:{} _ color:{} _ size:{} _ quantityAvailable:{} _ ' \
               'oldPrice:{} _ newPrice:{} )' \
            .format(self.id, self.shoe.shoeName, self.color.colorName, self.size, self.quantityAvailable,
                    self.oldPrice, self.newPrice)
