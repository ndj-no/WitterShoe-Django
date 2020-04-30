from django.urls import path
from .views import *

app_name = 'mainapp'

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('product_detail/<int:product_id>/', ProductDetailView.as_view(), name='product_detail'),
    path('products/', ProductsByCategory.as_view(), name='products_url'),
]
