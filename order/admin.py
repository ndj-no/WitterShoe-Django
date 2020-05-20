from django.contrib import admin
from .models import OrderItem, OrderPackage


class OrderItemInline(admin.TabularInline):
    model = OrderItem


class OrderItemAdmin(admin.ModelAdmin):
    model = OrderItem
    list_display = ['orderPackage', 'detailShoe', 'quantity', 'itemPrice']
    list_per_page = 30


class OrderPackageAdmin(admin.ModelAdmin):
    inlines = (
        OrderItemInline,
    )
    list_display = ('id', 'status', 'receiver', 'receiverNumber', 'totalPayment', 'dateOrder')
    list_display_links = ('status', 'receiver')
    search_fields = ('dateOrder', 'receiver', 'receiverNumber', 'status', 'receiverAddress')
    list_per_page = 30


admin.site.register(OrderPackage, OrderPackageAdmin)
admin.site.register(OrderItem, OrderItemAdmin)
