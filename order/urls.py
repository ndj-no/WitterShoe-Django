from django.urls import path
from .views import OrderHistoryView, OrderDetailView, PlaceOrder, CancelOrder

app_name = 'order'

urlpatterns = [
    path('order_history/', OrderHistoryView.as_view(), name='order_history_url'),
    path('detail/<int:order_package_id>/', OrderDetailView.as_view(), name='order_detail_url'),
    path('place_order/', PlaceOrder.as_view(), name='place_order_url'),
    path('cancel_order/<int:order_package_id>/', CancelOrder.as_view(), name='cancel_order_url'),
]
