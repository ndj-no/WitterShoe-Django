# Generated by Django 3.0.5 on 2020-06-13 08:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('coupon', '0004_coupon_couponimage'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='coupon',
            options={'verbose_name_plural': 'Mã giảm giá'},
        ),
        migrations.AlterModelTable(
            name='coupon',
            table='coupon',
        ),
    ]
