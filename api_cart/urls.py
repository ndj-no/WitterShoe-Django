from django.urls import path

from api_cart.views import add_to_cart

app_name = 'api_cart'

urlpatterns = [
    path('add_to_cart/', add_to_cart, name='api_register_messenger_user'),
]
