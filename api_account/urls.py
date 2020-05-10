from django.urls import path
from .views import register_messenger_user, GetUserInfoApiView

app_name = 'api_account'

urlpatterns = [
    path('register_messenger_user/', register_messenger_user),
    path('get_user_info/', GetUserInfoApiView.as_view()),
]
