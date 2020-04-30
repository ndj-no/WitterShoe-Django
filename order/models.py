from django.db import models
from django.utils import timezone
from coupon.models import Coupon
from mainapp.models import User, DetailShoe


# Create your models here.

class OrderPackageStatus(models.Model):
    statusName = models.CharField(max_length=128, null=False)
    statusDesc = models.CharField(max_length=255, default='', blank=True)


class OrderPackage(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    coupon = models.ForeignKey(Coupon, on_delete=models.CASCADE)
    dateOrder = models.DateField(default=timezone.now)
    dateDelivery = models.DateField(default=timezone.now)
    receiver = models.CharField(max_length=128)
    receiverNumber = models.CharField(max_length=32)
    receiverAddress = models.CharField(max_length=255)
    note = models.CharField(max_length=255, default='')
    status = models.IntegerField(default=0)
    totalPayment = models.IntegerField()
    orderPackageNote = models.CharField(max_length=255, default='', blank=True)

    def __str__(self):
        if int(self.status) == 0:
            status = 'Waiting'
        else:
            status = 'Delivered'

        return '[{}] OrderPackage( id:{} _ username:{} _ receiver:{} _ receiverAddress:{} _ totalPayment:{} )' \
            .format(status, self.id, self.user.username, self.receiver, self.receiverAddress, self.totalPayment)


class OrderItem(models.Model):
    orderPackage = models.ForeignKey(OrderPackage, on_delete=models.CASCADE)
    detailShoe = models.ForeignKey(DetailShoe, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    itemPrice = models.IntegerField()

    def __str__(self):
        return 'OrderItem( id:{} _ receiver:{} _ shoe:{} _ quantity:{} _ unitPrice:{} )' \
            .format(self.id, self.orderPackage.receiver, self.detailShoe.shoe.shoeName, self.quantity, self.itemPrice)
