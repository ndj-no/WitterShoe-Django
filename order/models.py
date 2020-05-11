from django.db import models
from django.utils import timezone
from coupon.models import Coupon
from mainapp.models import User, DetailShoe


class OrderPackage(models.Model):
    status_choice = ((0, 'Đã hủy (user)'), (1, 'Chờ xác nhận'), (2, 'Đang giao'), (3, 'Đã giao'), (4, 'Từ chối (admin)'))
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    coupon = models.ForeignKey(Coupon, on_delete=models.CASCADE)
    dateOrder = models.DateField(default=timezone.now)
    dateDelivery = models.DateField(default=timezone.now)
    receiver = models.CharField(max_length=128)
    receiverNumber = models.CharField(max_length=32)
    receiverAddress = models.CharField(max_length=255)
    note = models.TextField(max_length=255, default='', blank=True)
    status = models.IntegerField(choices=status_choice)
    totalPayment = models.IntegerField()

    def __str__(self):
        status = None
        for s in self.status_choice:
            if s[0] == self.status:
                status = s[1]

        return '[{}] id:{} _ username:{} _ receiver:{} _ receiverAddress:{} _ totalPayment:{}' \
            .format(status, self.id, self.user.username, self.receiver, self.receiverAddress, self.totalPayment)


class OrderItem(models.Model):
    orderPackage = models.ForeignKey(OrderPackage, on_delete=models.CASCADE)
    detailShoe = models.ForeignKey(DetailShoe, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    itemPrice = models.IntegerField()

    def __str__(self):
        return 'id:{} _ package_id {} _ receiver:{} _ shoe:{} _ quantity:{} _ unitPrice:{}' \
            .format(self.id, self.orderPackage.id, self.orderPackage.receiver, self.detailShoe.shoe.shoeName,
                    self.quantity, self.itemPrice)
