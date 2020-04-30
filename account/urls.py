from django.urls import path
from .views import *

app_name = 'account'

urlpatterns = [
    path('login/', LoginView.as_view(), name='login_url'),
    path('register/', RegisterView.as_view(), name='register_url'),
    path('logout/', logoutView, name='logout_url')
]
