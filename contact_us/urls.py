from django.urls import path
from .views import *

app_name = 'contact_us'

urlpatterns = [
    path('', contact_us_view.as_view(), name='contact_url'),
]
