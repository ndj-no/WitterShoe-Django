from account.models import User
from cart.models import Cart
from mainapp.models import DetailShoe, Shoe


def messenger_user_save_cart(post_data: dict, messenger_id):
    detail_shoes_id = post_data.get('detail_shoes_id')
    carts = Cart.objects.filter(user__messengerId=messenger_id)
    if detail_shoes_id:
        for detail_shoe_id in detail_shoes_id:
            detail_shoe = DetailShoe.objects.filter(id=detail_shoe_id).first()
            qt = int(post_data.get('qt_' + detail_shoe_id)[0])
            cart = carts.filter(detailShoe_id=detail_shoe.id).first()
            if 1 <= qt <= detail_shoe.quantityAvailable:
                cart.quantityOnCart = qt
                cart.save()


def messenger_user_delete_cart(messenger_id, detail_shoe_id):
    messenger_user = User.objects.filter(messengerId=messenger_id).first()
    if messenger_user:
        cart = Cart.objects.filter(detailShoe_id=detail_shoe_id).first()
        cart.delete()
