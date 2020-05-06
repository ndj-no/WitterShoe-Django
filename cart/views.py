from django.contrib.auth import decorators
from django.shortcuts import render, redirect
from django.template.defaulttags import register
from django.views import View

from coupon.coupon_logic import get_coupon_available
from mainapp.models import Shoe, Color, DetailShoe
from my_utils.string_format import price_format
from .models import Cart

login_url = '/account/login/'


@decorators.login_required(login_url=login_url)
def cart_view(request):
    user_id = request.user.id
    cart_items = Cart.objects.filter(user_id=user_id)
    couponCode = request.GET.get('coupon', None)
    coupon_message = None
    discountAmount = 0
    discountRate = 0

    if couponCode:
        coupon = get_coupon_available(couponCode)
        if coupon:
            discountAmount = coupon.discountAmount
            discountRate = coupon.discountRate
        else:
            coupon_message = 'Coupon này không tồn tại hoặc đã hết hạn.'

    detail_shoes = DetailShoe.objects.filter(cart__user_id=user_id)
    shoe_names = {}
    shoe_ids = {}
    shoe_thumbnails = {}
    shoe_colors = {}
    shoe_quantity = {}
    status = {}
    status_code = {}
    totalprice = {}
    total_products_price = 0
    for detail_shoe in detail_shoes:
        shoe = Shoe.objects.filter(detailshoe=detail_shoe).first()
        shoe_names[detail_shoe.id] = shoe.shoeName
        shoe_ids[detail_shoe.id] = shoe.id
        shoe_thumbnails[detail_shoe.id] = shoe.shoeThumbnail.url
        shoe_colors[detail_shoe.id] = Color.objects.filter(detailshoe=detail_shoe).first().colorName
        shoe_quantity[detail_shoe.id] = Cart.objects.filter(detailShoe=detail_shoe).first().quantityOnCart
        if detail_shoe.quantityAvailable > 0:
            status[detail_shoe.id] = 'Còn hàng'
            status_code[detail_shoe.id] = True
        else:
            status[detail_shoe.id] = 'Hết hàng'
            status_code[detail_shoe.id] = False
        # tong gia tung loai giay
        totalprice[detail_shoe.id] = shoe_quantity[detail_shoe.id] * detail_shoe.newPrice

        # tong gia tat ca san pham
        if status_code[detail_shoe.id]:
            total_products_price += totalprice[detail_shoe.id]

        # format sang comma separated for front end
        totalprice[detail_shoe.id] = price_format(totalprice[detail_shoe.id])

    # tinh gia cuoi cung after coupon
    total_discount = int((discountAmount + (total_products_price - discountAmount) * discountRate / 100))
    final_price = total_products_price - total_discount

    context = {
        'number_item': len(cart_items),
        'coupon_code': '' if couponCode is None else couponCode,
        'coupon_message': coupon_message,
        'detail_shoes': detail_shoes,
        'shoe_names': shoe_names,
        'shoe_ids': shoe_ids,
        'shoe_thumbnails': shoe_thumbnails,
        'shoe_colors': shoe_colors,
        'shoe_quantity': shoe_quantity,
        'status': status,
        'status_code': status_code,
        'totalprice': totalprice,
        'total_products_price': price_format(total_products_price),
        'total_discount': price_format(total_discount),
        'final_price': price_format(final_price),
        'discount_amount': discountAmount,
        'discount_rate': discountRate,
    }
    return render(request, 'cart/cart.html', context)


@decorators.login_required(login_url=login_url)
def add_to_cart(request):
    to = request.GET.get('next', None)

    if request.method == 'POST':
        user_id = request.user.id
        shoe_id = request.POST.get('shoe_id', None)
        quantity = request.POST.get('quantity', None)
        color = request.POST.get('color', None)
        size = request.POST.get('size', None)
        if size and color and shoe_id and int(quantity) > 0:
            detail_shoe = DetailShoe.objects.get(shoe_id=shoe_id, color__colorName__exact=color, size=size)
            cart = Cart.objects.filter(user_id=user_id, detailShoe=detail_shoe).first()
            if cart is None:
                cart = Cart()
                cart.user_id = user_id
                cart.detailShoe = detail_shoe
                cart.quantityOnCart = int(quantity)
                cart.save()
            else:
                cart.quantityOnCart += int(quantity)
                cart.save()
    if to:
        return redirect(to)
    else:
        return redirect('mainapp:index')


@decorators.login_required(login_url=login_url)
def remove_from_cart(request):
    user_id = request.user.id
    detail_shoe_id = request.GET.get('detail_shoe_id', None)
    if detail_shoe_id:
        cart = Cart.objects.filter(user_id=user_id, detailShoe_id=detail_shoe_id).first()
        if cart is not None:
            cart.delete()

    to = request.GET.get('next', None)
    if to:
        return redirect(to)
    else:
        return redirect('mainapp:index')


class CartByUserView(View):
    def get(self, request):
        pass


@register.filter
def template_price_format(value):
    return price_format(value)
