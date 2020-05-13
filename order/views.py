from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render

from mainapp.views import MainFrameView
from . import order_logic
from .models import OrderPackage

# Create your views here.
from .order_logic import cancel_the_order


class OrderHistoryView(LoginRequiredMixin, MainFrameView):
    login_url = '/account/login/'
    redirect_field_name = 'next'

    def get(self, request):
        self.update_top_bar(request)
        user_id = request.user.id
        order_packages = OrderPackage.objects.filter(user_id=user_id).order_by('dateOrder', 'id').reverse()
        if len(order_packages) == 0:
            self.context.update({'message': 'Bạn chưa đặt gói hàng nào'})
            return render(request, 'order/order_history.html', self.context)

        context = {
            'order_packages': order_packages,
        }
        self.context.update(context)
        return render(request, 'order/order_history.html', self.context)

    def post(self, request):
        self.get(request)


class OrderDetailView(LoginRequiredMixin, MainFrameView):
    def get(self, request, order_package_id):
        order_package = OrderPackage.objects.filter(user_id=request.user.id).filter(id=order_package_id).first()
        if order_package is None:
            # k đặt hàng mà cũng đòi xem??? 1 click GG
            context = {
                'message': 'Nà ní? Chương trình chống hack khởi động lâu rồi\nHaxagi',
                'next': '/order/order_history/'
            }
            return render(request, 'mainapp/layout/show_alert_message.html', self.context)

        context = order_logic.get_detail_ordered_package(package_id=order_package_id)
        self.context.update(context)
        return render(request, 'order/order_detail.html', self.context)


class PlaceOrder(LoginRequiredMixin, MainFrameView):
    def post(self, request):
        post_values = dict(request.POST)
        print(post_values)
        context = order_logic.place_an_order(post_values, request.user)
        self.context.update(context)
        return render(request, 'order/show_alert_message.html', self.context)


class CancelOrder(LoginRequiredMixin, MainFrameView):
    def get(self, request, order_package_id):
        context = cancel_the_order(request.user, order_package_id)
        self.context.update(context)
        return render(request, 'order/show_alert_message.html', self.context)
