# Generated by Django 3.0.5 on 2020-05-20 10:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('contact_us', '0003_auto_20200423_2303'),
    ]

    operations = [
        migrations.AddField(
            model_name='feedback',
            name='read',
            field=models.BooleanField(default=False),
        ),
    ]
