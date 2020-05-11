from django.urls import path
from .views import LoginView, RegisterView, logout_view, MyAccountView, ContactInfo

app_name = 'account'

urlpatterns = [
    path('login/', LoginView.as_view(), name='login_url'),
    path('register/', RegisterView.as_view(), name='register_url'),
    path('logout/', logout_view, name='logout_url'),
    path('my_account/', MyAccountView.as_view(), name='my_account_url'),
    path('contact_info/<int:messenger_id>/', ContactInfo.as_view(), name='my_account_url'),
]
