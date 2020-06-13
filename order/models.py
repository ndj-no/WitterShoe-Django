from django.db import models
from django.utils import timezone
from coupon.models import Coupon
from mainapp.models import User, DetailShoe


class OrderPackage(models.Model):
    status_choice = (
        (1, 'Chờ xác nhận'), (2, 'Đang giao'), (3, 'Đã giao'), (4, 'Cửa hàng từ chối'), (5, 'Người dùng hủy')
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    coupon = models.ForeignKey(Coupon, on_delete=models.CASCADE)
    dateOrder = models.DateTimeField(default=timezone.now)
    dateDelivery = models.DateTimeField(default=timezone.now)
    receiver = models.CharField(max_length=128)
    receiverNumber = models.CharField(max_length=32)
    receiverAddress = models.CharField(max_length=255)
    note = models.TextField(max_length=255, default='', blank=True)
    status = models.IntegerField(choices=status_choice)
    totalPayment = models.IntegerField()

    class Meta:
        ordering = ('status', '-id')
        verbose_name_plural = "Đơn hàng"
        db_table = 'order_package'

    def __str__(self):
        status = None
        for s in self.status_choice:
            if s[0] == self.status:
                status = s[1]

        return '[{}] id:{} _ receiver:{} _ receiverAddress:{} _ totalPayment:{}' \
            .format(status, self.id, self.receiver, self.receiverAddress, self.totalPayment)


class OrderItem(models.Model):
    orderPackage = models.ForeignKey(OrderPackage, on_delete=models.CASCADE)
    detailShoe = models.ForeignKey(DetailShoe, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    itemPrice = models.IntegerField()

    def __str__(self):
        return '[{}] - Package [{}] - {} - {} - Size:{} - Màu:{} - SL: {} - Price: {}' \
            .format(self.id,
                    self.orderPackage.id,
                    self.orderPackage.receiver,
                    self.detailShoe.shoe.shoeName,
                    self.detailShoe.size,
                    self.detailShoe.color.colorName,
                    self.quantity,
                    self.itemPrice)

    class Meta:
        db_table = 'order_item'
