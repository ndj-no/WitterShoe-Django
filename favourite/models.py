from django.db import models
from mainapp.models import User, Shoe


# Create your models here.
class Favourite(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    shoe = models.ForeignKey(Shoe, on_delete=models.CASCADE)
    date_like = models.DateField(auto_now=True)

    def __str__(self):
        return 'Favourite( id:{} _ user:{} _ like:{})'.format(self.id, self.user.displayName, self.shoe.shoeName)

    class Meta:
        db_table = 'favourite'
