from django.urls import path
from .views import AboutUsView, hdsd_bot

app_name = 'about_us'

urlpatterns = [
    path('', AboutUsView.as_view(), name='about_us_url'),
    path('hdsd_bot/', hdsd_bot, name='about_us_url'),
]
