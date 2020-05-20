from django.db import models
from django.utils import timezone
from mainapp.models import User, DetailShoe
from coupon.models import Coupon


# Create your models here.

class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    detailShoe = models.ForeignKey(DetailShoe, on_delete=models.CASCADE)
    quantityOnCart = models.IntegerField(default=1)

    def __str__(self):
        return '[{}] {} - {} - {}' \
            .format(self.id, self.user.username, self.detailShoe.shoe.shoeName, self.quantityOnCart)
