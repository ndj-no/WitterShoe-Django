# Generated by Django 3.0.5 on 2020-05-12 17:03

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0002_auto_20200505_2307'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orderpackage',
            name='dateDelivery',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='orderpackage',
            name='dateOrder',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
