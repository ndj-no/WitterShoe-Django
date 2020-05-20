from datetime import datetime, date

from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render

from django.utils import timezone
from mainapp.views import MainFrameView, User

from .statistic_logic import Statistic


def do_statistic(date1, date2):
    statistic = Statistic(date1=date1, date2=date2)
    return statistic.do_it()


class StatisticView(LoginRequiredMixin, MainFrameView):

    def get(self, request):
        self.update_top_bar(request)
        if not request.user.is_staff:
            return render(request, 'mainapp/layout/show_alert_message.html',
                          {'message': 'Xin lỗi. Bạn không có quyền xem trang này', 'next': '/'})

        date2 = timezone.now().date()
        if date2.month > 3:
            date1 = date2.replace(month=(date2.month - 3))
        else:
            date1 = date2.replace(year=(date2.year - 1), month=(12 - (3 - date2.month)))

        context = {
            'years': get_list_years(),
            'date1': date1,
            'date2': date2
        }
        context.update(do_statistic(date1, date2))
        self.context.update(context)
        return render(request, 'statistic/statistic_page.html', self.context)

    def post(self, request):
        self.update_top_bar(self.request)
        post_data = dict(request.POST)

        if not request.user.is_staff:
            return render(request, 'mainapp/layout/show_alert_message.html',
                          {'message': 'Xin lỗi. Bạn không có quyền xem trang này', 'next': '/'})

        date1 = date(year=int(post_data.get('year1')[0]), month=int(post_data.get('month1')[0]), day=1)
        date2 = date(year=int(post_data.get('year2')[0]), month=int(post_data.get('month2')[0]), day=1)

        context = {
            'years': get_list_years(),
            'date1': date1,
            'date2': date2
        }
        context.update(do_statistic(date1, date2))

        self.context.update(context)
        return render(request, 'statistic/statistic_page.html', self.context)


def get_list_years():
    user = User.objects.filter(username='admin').first()
    user: User
    years = [year for year in range(user.date_joined.year, timezone.now().year + 1)]
    return years
