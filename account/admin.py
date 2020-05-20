from django.contrib import admin
from django.contrib.auth.models import Group

from order.models import OrderPackage
from .models import User, GroupAdminForm


class OrderPackageInline(admin.TabularInline):
    model = OrderPackage


class UserAdmin(admin.ModelAdmin):
    inlines = (OrderPackageInline,)

    list_display = ('id', 'username', 'displayName', 'phone', 'is_staff')
    list_display_links = ('username',)
    search_fields = ('displayName', 'username', 'phone')
    list_per_page = 30


# Register your models here.
admin.site.register(User, UserAdmin)

# Unregister the original Group admin.
admin.site.unregister(Group)


# Create a new Group admin.
class GroupAdmin(admin.ModelAdmin):
    # Use our custom form.
    form = GroupAdminForm
    # Filter permissions horizontal as well.
    filter_horizontal = ['permissions']


# Register the new Group ModelAdmin.
admin.site.register(Group, GroupAdmin)
