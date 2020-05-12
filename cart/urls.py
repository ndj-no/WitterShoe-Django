from django.urls import path
from .views import cart_view, add_to_cart, remove_from_cart, CartBuyNow, cart_messenger_view, update_qt, \
    CartBuyNowMessengerUser, EditCartMessengerUser, DeleteCartMessengerUser

app_name = 'cart'

urlpatterns = [
    path('', cart_view, name='cart_url'),
    # path('<int:messenger_id>/', cart_messenger_view, name='cart_url'),
    path('add/', add_to_cart, name='add_to_cart_url'),

    # called when press update quantity button on cart page
    path('update_qt/', update_qt, name='update_qt_url'),
    # called when press delete button on cart page
    path('remove/', remove_from_cart, name='remove_from_cart_url'),
    path('buy_now/<int:detail_shoe_id>/', CartBuyNow.as_view(), name='cart_buy_now_url'),

    # for messenger user
    path('messenger_user/buy_now/<int:messenger_id>/<int:detail_shoe_id>/', CartBuyNowMessengerUser.as_view()),
    path('messenger_user_cart/edit/<int:messenger_id>/', EditCartMessengerUser.as_view()),
    path('messenger_user_cart/delete/', DeleteCartMessengerUser.as_view(), name='messenger_user_delete_cart_item_url'),
]
