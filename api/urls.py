from django.urls import path, include

app_name = 'api'

urlpatterns = [
    path('api_account/', include('api_account.urls')),
    path('api_coupon/', include('api_coupon.urls')),
    path('api_cart/', include('api_cart.urls')),
    path('api_order/', include('api_order.urls')),
]
