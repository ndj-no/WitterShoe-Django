from django.urls import path
from .views import like_unlike, MyFavourite

app_name = 'favourite'

urlpatterns = [
    path('like_unlike/<int:shoe_id>/', like_unlike, name='like_unlike_url'),
    path('my_favourite/', MyFavourite.as_view(), name='my_favourite_url'),
]
