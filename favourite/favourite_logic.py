from django.db.models.functions import Coalesce

from my_utils.string_format import price_format

from account.models import User
from mainapp.models import DetailShoe, Shoe


def get_product_liked(user: User):
    detail_shoes_price = {}
    shoes = Shoe.objects.filter(favourite__user_id=user.id).order_by(
        Coalesce('favourite__date_like', 'quantitySold').desc())
    for shoe in shoes:
        detail_shoes_price[shoe.id] = price_format(DetailShoe.objects.filter(shoe_id=shoe.id).first().newPrice)
    return {'shoes': shoes, 'detail_shoes_price': detail_shoes_price}
