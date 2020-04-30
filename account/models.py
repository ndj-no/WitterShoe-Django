from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    displayName = models.CharField(max_length=128)
    messengerId = models.CharField(max_length=128)
    phone = models.CharField(max_length=32)
    defaultAddress = models.CharField(max_length=255)
    gender = models.IntegerField(choices=((0, 'Nữ'), (1, 'Nam'), (2, 'Không xác định')), default=1)

    def __str__(self):
        return 'User( id:{}_ MessengerId:{}_ username:{}_ displayName:{}_ phone:{} )'.format(self.id, self.messengerId,
                                                                                             self.username,
                                                                                             self.displayName,
                                                                                             self.phone)
