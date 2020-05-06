from django.contrib import admin
from .models import OrderItem, OrderPackage

# Register your models here.
admin.site.register(OrderPackage)
admin.site.register(OrderItem)
