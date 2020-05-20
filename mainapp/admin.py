from django.contrib import admin
from django.utils.safestring import mark_safe

from .models import Color, Category, Brand, Shoe, Image, DetailShoe
from django.contrib.admin.widgets import AdminFileWidget
from django.db import models

admin.site.site_header = 'Bảng điều khiển - Witter'


class AdminImageWidget(AdminFileWidget):

    def render(self, name, value, attrs=None, renderer=None):
        output = []

        if value and getattr(value, "url", None):
            image_url = value.url
            file_name = str(value)

            output.append(
                f' <a href="{image_url}" target="_blank">'
                f'  <img src="{image_url}" alt="{file_name}" width="150" height="150" '
                f'style="object-fit: cover;"/> </a>')

        output.append(super(AdminFileWidget, self).render(name, value, attrs, renderer))
        return mark_safe(u''.join(output))


class ImageInline(admin.TabularInline):
    model = Image
    extra = 1
    formfield_overrides = {
        models.ImageField: {'widget': AdminImageWidget}
    }


class DetailShoeInline(admin.TabularInline):
    model = DetailShoe


class ShoeAdmin(admin.ModelAdmin):
    inlines = [
        ImageInline,
        DetailShoeInline,
    ]
    list_display = ('id', 'shoeModel', 'shoeName', 'category', 'brand', 'active')
    list_display_links = ('shoeModel', 'shoeName')
    search_fields = ('shoeName', 'shoeModel', 'category__categoryName', 'brand__brandName')
    list_per_page = 30


admin.site.register(Color)
admin.site.register(Category)
admin.site.register(Brand)
admin.site.register(Shoe, ShoeAdmin)
admin.site.register(Image)
admin.site.register(DetailShoe)
