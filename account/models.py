from django.contrib.admin.widgets import FilteredSelectMultiple
from django.contrib.auth.models import AbstractUser, Group
from django.db import models
from django import forms


class User(AbstractUser):
    displayName = models.CharField(max_length=128)
    messengerId = models.CharField(max_length=128, blank=True)
    phone = models.CharField(max_length=32)
    defaultAddress = models.CharField(max_length=255)
    gender = models.IntegerField(choices=((0, 'Nữ'), (1, 'Nam'), (2, 'Không xác định')), default=1)

    def __str__(self):
        if self.is_staff:
            return '[{}] Username: {} - Name: {} - Phone: {} - Khách hàng'.format(self.id, self.username,
                                                                                  self.displayName,
                                                                                  self.phone)
        else:
            return '[{}] Username: {} - Name: {} - Phone: {} - Nhân viên'.format(self.id, self.username,
                                                                                 self.displayName,
                                                                                 self.phone)

    class Meta:
        db_table = 'user'


# Create ModelForm based on the Group model.
class GroupAdminForm(forms.ModelForm):
    class Meta:
        model = Group
        exclude = []

    # Add the users field.
    users = forms.ModelMultipleChoiceField(
        queryset=User.objects.all(),
        required=False,
        # Use the pretty 'filter_horizontal widget'.
        widget=FilteredSelectMultiple('users', False)
    )

    def __init__(self, *args, **kwargs):
        # Do the normal form initialisation.
        super(GroupAdminForm, self).__init__(*args, **kwargs)
        # If it is an existing group (saved objects have a pk).
        if self.instance.pk:
            # Populate the users field with the current Group users.
            self.fields['users'].initial = self.instance.user_set.all()

    def save_m2m(self):
        # Add the users to the Group.
        self.instance.user_set.set(self.cleaned_data['users'])

    def save(self, *args, **kwargs):
        # Default save
        instance = super(GroupAdminForm, self).save()
        # Save many-to-many data
        self.save_m2m()
        return instance
