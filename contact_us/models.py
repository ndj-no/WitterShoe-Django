from django.db import models
from django.utils import timezone


# Create your models here.
class Feedback(models.Model):
    name = models.CharField(max_length=32, blank=False)
    email = models.CharField(max_length=64, blank=False)
    subject = models.CharField(max_length=64, blank=True)
    content = models.TextField(max_length=1024, blank=False)
    dateSend = models.DateField(default=timezone.now)

    def __str__(self):
        return 'id:{} - name:{} - subject:{}'.format(self.id, self.name, self.subject)
