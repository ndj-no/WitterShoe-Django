from django.db import models

from coupon.models import Coupon
from mainapp.models import User, DetailShoe


# Create your models here.

class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    detailShoe = models.ForeignKey(DetailShoe, on_delete=models.CASCADE)
    quantityOnCart = models.IntegerField(default=1)

    def __str__(self):
        return '[{}] {} - {} - {}' \
            .format(self.id, self.user.username, self.detailShoe.shoe.shoeName, self.quantityOnCart)

    # class Meta:
    #     db_table = 'cart'
