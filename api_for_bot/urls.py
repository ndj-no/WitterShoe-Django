from django.urls import path
from .views import register_messenger_user, add_to_cart

app_name = 'api_for_bot'

urlpatterns = [
    path('register_messenger_user/', register_messenger_user, name='api_register_messenger_user'),
    path('add_to_cart/', add_to_cart, name='api_register_messenger_user'),
]
