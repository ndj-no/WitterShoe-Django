from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect

from favourite import favourite_logic
from favourite.models import Favourite
from mainapp.models import Shoe
from mainapp.views import MainFrameView


def like_unlike(request, shoe_id):
    to = request.GET.get('next', '/')
    user = request.user
    if user.is_authenticated:
        shoe = Shoe.objects.filter(id=shoe_id).first()
        favourite = Favourite.objects.filter(user_id=user.id, shoe_id=shoe_id)
        if favourite:
            shoe.favouriteCount -= 1
            shoe.save()
            favourite.delete()
        else:
            favourite = Favourite(user=user, shoe=shoe)
            favourite.save()
            shoe.favouriteCount += 1
            shoe.save()
    return redirect(to)


class MyFavourite(LoginRequiredMixin, MainFrameView):
    def get(self, request):
        self.update_top_bar(request)
        context = favourite_logic.get_product_liked(request.user)
        # context = {
        #     'shoes': shoes,
        #     'detail_shoes_price': detail_shoes_price
        # }
        self.context.update(context)
        return render(request, 'favourite/favourite_list.html', self.context)
