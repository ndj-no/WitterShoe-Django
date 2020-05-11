from django.urls import path
from .views import PlaceAnOrder

app_name = 'api_order'

urlpatterns = [
    # endpoint /api/api_order/place_an_order/
    path('place_an_order/', PlaceAnOrder.as_view()),
]
