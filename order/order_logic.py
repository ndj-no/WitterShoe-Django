from datetime import timedelta
from typing import Dict

from django.utils import timezone

from account.models import User
from cart.models import Cart
from coupon import coupon_logic
from coupon.models import Coupon
from mainapp.models import DetailShoe, Shoe

from .models import OrderPackage, OrderItem


class PackageStatus:
    #     status_choice = ((0, 'Đã hủy'), (1, 'Chờ xác nhận'), (2, 'Đang giao'), (3, 'Đã giao'), (4, 'cancel by admin'))

    CANCELLED_BY_USER = 0
    WAITING = 1
    ON_DELIVERY = 2
    DELIVERED = 3
    CANCELLED_BY_ADMIN = 4


def is_enough_quantity_available(qt_want, detail_shoe_id):
    detail_shoe = DetailShoe.objects.filter(detail_shoe_id=detail_shoe_id).first()
    if detail_shoe is None:
        return False

    return qt_want <= detail_shoe.quantityAvailable


def get_status_waiting_confirming():
    """
    status_choice = ((0, 'Đã hủy'), (1, 'Chờ xác nhận'), (2, 'Đang giao'), (3, 'Đã giao'), (4, 'cancel by admin'))
    :return:
    """
    return 1


def place_an_order(post_values: Dict, user: User) -> Dict:
    """
    return the context to send to view
    :param user:
    :param post_values:
    :return: Dict
    """
    context = {'is_success': False}

    print(post_values)
    is_enough_shoe = True
    order_items = []
    total_payment = 0
    for detail_shoe_id in post_values.get('detail_shoes_id'):
        if post_values.get('is_buy_' + detail_shoe_id) is not None:
            detail_shoe = DetailShoe.objects.get(pk=detail_shoe_id)
            qt = int(post_values.get('qt_' + detail_shoe_id)[0])
            total_payment += detail_shoe.newPrice * qt
            order_items.append(OrderItem(detailShoe=detail_shoe, quantity=qt, itemPrice=detail_shoe.newPrice))

            if qt > detail_shoe.quantityAvailable:
                is_enough_shoe = False
                break

    if len(order_items) == 0:
        context['message'] = 'Bạn chưa chọn món hàng nào'
        context['next'] = '/cart/'
        return context
    elif not post_values.get('address') or not post_values.get('phone'):
        context['message'] = 'Bạn chưa điền đầy đủ thông tin nhận hàng!'
        context['next'] = '/cart/'
        return context
    elif post_values.get('address')[0].strip() == '' or post_values.get('phone')[0].strip() == '':
        context['message'] = 'Bạn chưa điền đầy đủ thông tin nhận hàng!'
        context['next'] = '/cart/'
        return context
    elif not is_enough_shoe:
        context['message'] = 'Đặt hàng thất bại. Lượng hàng bạn đặt nhiều hơn chúng tôi có!'
        context['next'] = '/cart/'
        return context

    package = OrderPackage()
    package.user = user
    # check coupon is available?
    coupon = coupon_logic.get_coupon_available(post_values.get('coupon_code')[0])
    if coupon:
        print(coupon)
        package.coupon = coupon
    else:
        # coupon mac dinh. k giam gia gi het
        coupon = coupon_logic.get_default_coupon()
        package.coupon = coupon
        print(package.coupon)
    package.dateOrder = timezone.now()
    # 7 days later
    package.dateDelivery = timezone.now() + timedelta(days=7)
    package.receiver = post_values.get('receiver')[0]
    package.receiverAddress = post_values.get('address')[0]
    package.receiverNumber = post_values.get('phone')[0]
    package.totalPayment = coupon_logic.calc_price(total_payment, coupon_id=coupon.id)
    package.status = get_status_waiting_confirming()

    package.save()
    coupon.couponAmount = coupon.couponAmount - 1
    coupon.save()

    for order_item in order_items:
        order_item.orderPackage = package
        order_item.save()
        # giam so luong giay xuong
        detail_shoe = order_item.detailShoe
        detail_shoe.quantityAvailable = detail_shoe.quantityAvailable - order_item.quantity
        detail_shoe.save()
        # tang so luong giay da ban duoc
        shoe = Shoe.objects.get(pk=detail_shoe.shoe_id)
        shoe.quantitySold = shoe.quantitySold + order_item.quantity
        shoe.save()
        # xoa khoi cart
        cart_item = Cart.objects.filter(user_id=user.id, detailShoe_id=detail_shoe.id).first()
        if cart_item is not None:
            cart_item.delete()
    context['is_success'] = True
    context['orderPackage_id'] = package.id
    context['message'] = 'Đặt hàng thành công. Bạn vui lòng đợi cửa hàng xác nhận và giao hàng.'
    context['next'] = '/order/order_history/'
    return context


def cancel_the_order(user: User, package_id):
    context = {}
    # print(package_id)
    package = OrderPackage.objects.get(pk=package_id)

    if package.user.id != user.id:
        context['message'] = 'Từ chối hack. bạn k có đặt gói hàng này'
        context['next'] = '/order/order_history/'
        return context

    order_items = OrderItem.objects.filter(orderPackage=package)
    for item in order_items:
        detail_shoe = item.detailShoe
        detail_shoe.quantityAvailable += item.quantity
        detail_shoe.save()

        shoe = Shoe.objects.get(pk=detail_shoe.shoe_id)
        shoe.quantitySold = shoe.quantitySold - item.quantity
        shoe.save()
        coupon = Coupon.objects.filter(id=package.coupon_id).first()
        if coupon:
            coupon.couponAmount += 1
            coupon.save()
    package.status = PackageStatus.CANCELLED_BY_USER
    package.save()

    context['message'] = 'Hủy thành công'
    context['next'] = '/order/order_history/'
    return context
