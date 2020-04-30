from django.contrib import admin
from .models import OrderPackageStatus, OrderItem, OrderPackage

# Register your models here.
admin.site.register(OrderPackageStatus)
admin.site.register(OrderPackage)
admin.site.register(OrderItem)
