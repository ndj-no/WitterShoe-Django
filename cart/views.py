from django.contrib.auth import decorators
from django.contrib.auth import login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect
from django.template.defaulttags import register
from django.views import View
from django_user_agents.utils import get_user_agent

from account.models import User
from coupon.coupon_logic import get_coupon_available
from mainapp.models import Shoe, Color, DetailShoe
from my_utils.string_format import price_format
from . import cart_logic
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
        cart = Cart.objects.filter(detailShoe=detail_shoe).first()
        if cart.quantityOnCart <= detail_shoe.quantityAvailable:
            shoe_quantity[detail_shoe.id] = cart.quantityOnCart
        else:
            shoe_quantity[detail_shoe.id] = detail_shoe.quantityAvailable
            cart.quantityOnCart = detail_shoe.quantityAvailable
            cart.save()

        if not shoe.active:
            status[detail_shoe.id] = 'Liên hệ'
            status_code[detail_shoe.id] = False
        elif detail_shoe.quantityAvailable > 0:
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


def cart_messenger_view(request, messenger_id):
    user = User.objects.filter(messenger_id=messenger_id).first()
    if user:
        login(request, user)
        return redirect('/cart/')
    else:
        return redirect('/')


@decorators.login_required(login_url=login_url)
def add_to_cart(request):
    to = request.GET.get('next', 'mainapp:index')

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
                if detail_shoe.quantityAvailable < int(quantity):
                    context = {
                        'message': 'Thêm vào giỏ hàng thất bại. Trong kho chỉ còn {} đôi size: {}, màu: {}'.format(
                            detail_shoe.quantityAvailable, size, color),
                        'next': to
                    }
                    return render(request, 'mainapp/layout/show_alert_message.html', context)

                cart = Cart()
                cart.user_id = user_id
                cart.detailShoe = detail_shoe
                cart.quantityOnCart = int(quantity)
                cart.save()
            else:
                if cart.quantityOnCart + int(quantity) > detail_shoe.quantityAvailable:
                    context = {
                        'message': 'Thêm vào giỏ hàng thất bại. Trong kho chỉ còn {} đôi size: {}, màu: {}'.format(
                            detail_shoe.quantityAvailable, size, color),
                        'next': to
                    }
                    return render(request, 'mainapp/layout/show_alert_message.html', context)

                cart.quantityOnCart += int(quantity)
                cart.save()
    context = {
        'message': 'Thêm vào giỏ hàng thành công'.format(
            detail_shoe.quantityAvailable, size, color),
        'next': to
    }
    return render(request, 'mainapp/layout/show_alert_message.html', context)


@decorators.login_required(login_url=login_url)
def update_qt(request):
    user_id = request.user.id
    detail_shoe_id = request.GET.get('detail_shoe_id', None)
    new_quantity = request.GET.get('new_quantity', None)
    if detail_shoe_id:
        cart = Cart.objects.filter(user_id=user_id, detailShoe_id=detail_shoe_id).first()
        detail_shoe = DetailShoe.objects.filter(id=detail_shoe_id).first()
        if cart is not None and cart.quantityOnCart <= detail_shoe.quantityAvailable:
            cart.quantityOnCart = new_quantity
            cart.save()

    to = request.GET.get('next', None)
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

    to = request.GET.get('next', 'mainapp:index')

    return redirect(to)


class CartBuyNowMessengerUser(View):
    """
    for messenger user only. link provided by bot only
    this will automatic login the user and redirect to buy now link
    """

    def get(self, request, messenger_id, detail_shoe_id):

        user = User.objects.filter(messengerId=messenger_id).first()

        if user is not None:
            login(request, user)
            return redirect(f'/cart/buy_now/{detail_shoe_id}/')
        else:
            return render(request, template_name='order/show_alert_message.html',
                          context={'message': 'Truy cập bị từ chối. Hãy truy cập link do bot cung cấp',
                                   'next': '/'})


class CartBuyNow(LoginRequiredMixin, View):
    def get(self, request, detail_shoe_id):

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

        detail_shoe = DetailShoe.objects.filter(id=detail_shoe_id).first()
        user = request.user

        if user is not None:
            login(request, user)
        else:
            return render(request, template_name='order/show_alert_message.html',
                          context={'message': 'Truy cập bị từ chối. Hãy truy cập link do bot cung cấp',
                                   'next': '/'})

        if not detail_shoe:
            return render(request,
                          template_name='order/show_alert_message.html',
                          context={'message': 'Mặt hàng này không tồn tại', 'next': '/'})
        shoe_names = {}
        shoe_ids = {}
        shoe_thumbnails = {}
        shoe_colors = {}
        shoe_quantity = {}
        status = {}
        status_code = {}
        totalprice = {}
        total_products_price = 0

        shoe = Shoe.objects.filter(detailshoe=detail_shoe).first()
        shoe_names[detail_shoe.id] = shoe.shoeName
        shoe_ids[detail_shoe.id] = shoe.id
        shoe_thumbnails[detail_shoe.id] = shoe.shoeThumbnail.url
        shoe_colors[detail_shoe.id] = Color.objects.filter(detailshoe=detail_shoe).first().colorName
        shoe_quantity[detail_shoe.id] = 1
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
            'number_item': 1,
            'coupon_code': '' if couponCode is None else couponCode,
            'coupon_message': coupon_message,
            'detail_shoes': [detail_shoe],
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


class EditCartMessengerUser(View):
    def get(self, request, messenger_id):
        user_agent = get_user_agent(request)
        messenger_user = User.objects.filter(messengerId=messenger_id).first()
        context = {}
        if not messenger_user and user_agent.is_mobile:
            context['message'] = 'Người dùng không tồn tại'
            return render(request, 'cart/edit_cart_mobile_view.html', context=context)
        elif not messenger_user and user_agent.is_pc:
            context['message'] = 'Người dùng không tồn tại'
            context['next'] = '/'
            return render(request, 'mainapp/layout/show_alert_message.html', context)

        if user_agent.is_pc:
            # login roi tu sua tren giao dien web
            login(request, messenger_user)
            return redirect('/cart/')

        detail_shoes = DetailShoe.objects.filter(cart__user_id=messenger_user.id).filter(shoe__active=1).filter(
            quantityAvailable__gt=0)

        shoe_names = {}
        shoe_ids = {}
        shoe_thumbnails = {}
        shoe_colors = {}
        shoe_quantity = {}
        totalprice = {}
        total_products_price = 0
        for detail_shoe in detail_shoes:
            shoe = Shoe.objects.filter(detailshoe=detail_shoe).first()

            shoe_names[detail_shoe.id] = shoe.shoeName
            shoe_ids[detail_shoe.id] = shoe.id
            shoe_thumbnails[detail_shoe.id] = shoe.shoeThumbnail.url
            shoe_colors[detail_shoe.id] = Color.objects.filter(detailshoe=detail_shoe).first().colorName
            shoe_quantity[detail_shoe.id] = Cart.objects.filter(detailShoe=detail_shoe).first().quantityOnCart

            # tong gia tat ca san pham
            total_products_price += shoe_quantity[detail_shoe.id] * detail_shoe.newPrice

            # format sang 3-digit comma separated for display in front page
            totalprice[detail_shoe.id] = price_format(shoe_quantity[detail_shoe.id] * detail_shoe.newPrice)

        context = {
            'messenger_user': messenger_user,
            'number_item': len(detail_shoes),
            'detail_shoes': detail_shoes,
            'shoe_names': shoe_names,
            'shoe_ids': shoe_ids,
            'shoe_thumbnails': shoe_thumbnails,
            'shoe_colors': shoe_colors,
            'shoe_quantity': shoe_quantity,
            'totalprice': totalprice,
            'total_products_price': price_format(total_products_price),
        }
        return render(request, 'cart/edit_cart_mobile_view.html', context)

    def post(self, request, messenger_id):
        post_data = dict(request.POST)
        cart_logic.messenger_user_save_cart(post_data, messenger_id)
        return redirect(request.path)


class DeleteCartMessengerUser(View):
    def get(self, request):
        get_data = dict(request.GET)
        messenger_id = get_data['messenger_id'][0]
        detail_shoe_id = get_data['detail_shoe_id'][0]
        to = get_data['next'][0]
        # print(get_data)
        cart_logic.messenger_user_delete_cart(messenger_id=messenger_id, detail_shoe_id=detail_shoe_id)
        return redirect(to)


@register.filter
def template_price_format(value):
    return price_format(value)
