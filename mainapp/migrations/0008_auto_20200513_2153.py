# Generated by Django 3.0.5 on 2020-05-13 14:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0007_shoe_shoemodel'),
    ]

    operations = [
        migrations.AddField(
            model_name='shoe',
            name='dateModified',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='shoe',
            name='dateCreated',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
