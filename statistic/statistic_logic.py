import pathlib
from datetime import date, timedelta

import numpy as np
from django.db.models import Q
from django.utils import timezone
from matplotlib import pyplot as plt

from account.models import User
from mainapp.models import Shoe
from order.models import OrderPackage, OrderItem

# image_folder = '/home/nogardnah/PycharmProjects/WitterShoe/media/statistics/'
# print(pathlib.Path(__file__).parent.absolute())
image_folder = str(pathlib.Path(__file__).parent.absolute())
image_folder = image_folder.replace('WitterShoe/statistic', 'WitterShoe/media/statistics/')


class Statistic:
    def __init__(self, date1: date, date2: date):
        date1 = date1.replace(day=1)
        date2 = date2.replace(day=1)
        if date1 < date2:
            self.date1 = date1
            self.date2 = date2
        else:
            self.date1 = date2
            self.date2 = date1

    def do_it(self):
        context = {}

        # self.order_by_gender()

        # {'total_revenue', 'mean_revenue', 'revenue_by_month'}
        context.update(self.revenue())

        # {'total_order_packages': int,
        #  'total_order_packages_failed': int,
        #  'order_fail_rate': %}
        context.update(self.order_fail())

        # {'new_users', 'new_packages', 'packages_on_waiting'}
        context.update(self.today_info())

        context.update(self.top_sold_shoes())
        return context

    def today_info(self):
        today = timezone.now().date()
        tomorrow = (timezone.now() + timedelta(days=1)).date()

        packages = OrderPackage.objects.filter(dateOrder__gte=today) \
            .filter(dateOrder__lt=tomorrow)
        users = User.objects.filter(date_joined__gte=today).filter(date_joined__lt=tomorrow)
        new_users = len(users)
        new_packages = len(packages)
        packages_on_waiting = len(packages.filter(status=1))
        return {'new_users': new_users, 'new_packages': new_packages, 'packages_on_waiting': packages_on_waiting}

    def order_by_gender(self):
        # tỉ lệ đặt hàng theo giới tính. tính trên tất cả đơn hàng
        date1 = copy_date(self.date1)
        date2 = copy_date(self.date2)
        labels = []
        men_rate = []
        women_rate = []
        while date1 <= date2:
            if date1.month == 12:
                packages = OrderPackage.objects.filter(dateOrder__gte=date1) \
                    .filter(dateOrder__lt=date1.replace(month=1, year=(date1.year + 1)))
            else:
                packages = OrderPackage.objects.filter(dateOrder__gte=date1) \
                    .filter(dateOrder__lt=date1.replace(month=(date1.month + 1)))

            total_package = len(packages)
            # print('total_package', total_package)
            total_male = len(packages.filter(user__gender=1))
            # print('total_male', total_male)
            if total_package > 0:
                men_rate.append(int(total_male / total_package * 100))
                women_rate.append(100 - int(total_male / total_package * 100))
            else:
                men_rate.append(0)
                women_rate.append(0)

            labels.append(f'{date1.month}/{date1.year}')
            if date1.month == 12:
                date1 = date1.replace(month=1, year=(date1.year + 1))
            else:
                date1 = date1.replace(month=(date1.month + 1))
        grouped_2chart_save_figure(image_name='order_by_gender.png',
                                   title='Tỉ lệ đặt hàng theo giới tính',
                                   x_labels=labels,
                                   y_label='%',
                                   col_1_name='Nam',
                                   col_2_name='Nữ',
                                   col_1_data=men_rate,
                                   col_2_data=women_rate)

    # {'total_revenue', 'mean_revenue', 'revenue_by_month'}
    def revenue(self):
        date1 = copy_date(self.date1)
        date2 = copy_date(self.date2)

        total_revenue = 0
        revenue_by_month = []
        x_labels = []
        while date1 <= date2:
            if date1.month == 12:
                OrderPackage.objects.filter(dateOrder__gte=date1) \
                    .filter(dateOrder__lt=date1.replace(month=1, year=(date1.year + 1)))
            else:
                packages = OrderPackage.objects.filter(dateOrder__gte=date1) \
                    .filter(dateOrder__lt=date1.replace(month=(date1.month + 1)))

                s = 0
                for package in packages:
                    s = s + package.totalPayment
                s = s / 10 ** 6
                revenue_by_month.append(s)
                total_revenue = total_revenue + s
                x_labels.append(f'{date1.month}/{date1.year}')

            if date1.month == 12:
                date1 = date1.replace(month=1, year=(date1.year + 1))
            else:
                date1 = date1.replace(month=(date1.month + 1))
        plot_save_figure(image_name='revenue_statistic.png',
                         title='Doanh thu theo tháng',
                         x_labels=x_labels,
                         y_label='Triệu VND',
                         x_data=np.arange(len(revenue_by_month)),
                         y_data=revenue_by_month)
        return {'total_revenue': total_revenue,
                'mean_revenue': total_revenue / (len(revenue_by_month)),
                'revenue_by_month': revenue_by_month}

    # {'total_order_packages': int,
    #  'total_order_packages_failed': int,
    #  'order_fail_rate': %}
    def order_fail(self):
        date1 = copy_date(self.date1)
        date2 = copy_date(self.date2)
        labels = []
        orders_fail = []
        orders_success = []
        total_order_packages_failed = 0
        total_order_packages = 0
        while date1 <= date2:
            if date1.month == 12:
                packages = OrderPackage.objects.filter(dateOrder__gte=date1) \
                    .filter(dateOrder__lt=date1.replace(month=1, year=(date1.year + 1)))
            else:
                packages = OrderPackage.objects.filter(dateOrder__gte=date1) \
                    .filter(dateOrder__lt=date1.replace(month=(date1.month + 1)))

            packages_failed = packages.filter(Q(status=5) | Q(status=4))
            total_order_packages_failed += len(packages_failed)
            total_order_packages += len(packages)

            if len(packages) > 0:
                orders_fail.append(len(packages_failed))
                orders_success.append(len(packages) - len(packages_failed))
            else:
                orders_fail.append(0)
                orders_success.append(0)

            labels.append(f'{date1.month}/{date1.year}')
            if date1.month == 12:
                date1 = date1.replace(month=1, year=(date1.year + 1))
            else:
                date1 = date1.replace(month=(date1.month + 1))
        grouped_2chart_save_figure(image_name='order_fail.png',
                                   title='',
                                   x_labels=labels,
                                   y_label='Đơn hàng',
                                   col_1_name='Đơn bị hủy',
                                   col_2_name='Đơn không bị hủy',
                                   col_1_data=orders_fail,
                                   col_2_data=orders_success)
        return {'total_order_packages': total_order_packages,
                'total_order_packages_failed': total_order_packages_failed,
                'order_fail_rate': (total_order_packages_failed / total_order_packages * 100)}

    # total_sold_shoes,  shoes, quantity_sold
    def top_sold_shoes(self):
        date1 = copy_date(self.date1)
        date2 = copy_date(self.date2)
        total_sold_shoes = 0
        shoes = []
        quantity_sold = []
        while date1 <= date2:
            if date1.month == 12:
                order_items = OrderItem.objects.filter(orderPackage__dateOrder__gte=date1) \
                    .filter(orderPackage__dateOrder__lt=date1.replace(month=1, year=(date1.year + 1)))
            else:
                order_items = OrderItem.objects.filter(orderPackage__dateOrder__gte=date1) \
                    .filter(orderPackage__dateOrder__lt=date1.replace(month=(date1.month + 1)))

            order_items = order_items.filter(orderPackage__status__lte=3)
            for item in order_items:
                shoe = Shoe.objects.filter(detailshoe__orderitem=item).first()
                if shoe.shoeModel not in shoes:
                    shoes.append(str(shoe.shoeModel))
                    quantity_sold.append(int(item.quantity))
                else:
                    quantity_sold[shoes.index(shoe.shoeModel)] += int(item.quantity)

                total_sold_shoes += item.quantity

            if date1.month == 12:
                date1 = date1.replace(month=1, year=(date1.year + 1))
            else:
                date1 = date1.replace(month=(date1.month + 1))

        chart_save_figure(image_name='top_shoes.png', x_labels=shoes, y_label='Đôi', values=quantity_sold)
        return {
            'total_sold_shoes': total_sold_shoes,
            'shoes': shoes,
            'quantity_sold': quantity_sold,
        }


def plot_save_figure(image_name, title, x_labels, y_label, x_data, y_data):
    fig, ax = plt.subplots()
    plt.plot(x_data, y_data, linestyle='-.', marker='^', markersize=10)
    # plt.title(title)
    plt.ylabel(y_label)
    plt.xlabel('Thời gian')
    fig.canvas.draw()
    fig_labels = [item.get_text() for item in ax.get_xticklabels()]

    # thêm label cho các điểm
    for i, value in enumerate(y_data):
        ax.annotate(value, (x_data[i], y_data[i]))

    # set label cho x axis. nếu k nó sẽ là số
    x_labels_position = 0
    for i, fig_label in enumerate(fig_labels):

        if fig_label is not '' and float(fig_label.replace('−', '-')) in x_data:
            fig_labels[i] = x_labels[x_labels_position]
            x_labels_position += 1
        else:
            fig_labels[i] = ''

    ax.set_xticklabels(fig_labels)

    fig.tight_layout()
    plt.savefig(image_folder + image_name)


def grouped_2chart_save_figure(image_name, title, x_labels, y_label, col_1_name, col_2_name, col_1_data, col_2_data):
    plt.rcParams["figure.figsize"] = (8, 5)

    x = np.arange(len(x_labels))  # the label locations
    width = 0.38  # the width of the bars

    fig, ax = plt.subplots()
    rects1 = ax.bar(x - width / 2, col_1_data, width, label=col_1_name)
    rects2 = ax.bar(x + width / 2, col_2_data, width, label=col_2_name)

    # Add some text for labels, title and custom x-axis tick labels, etc.
    ax.set_ylabel(y_label)
    ax.set_xlabel('Thời gian')
    ax.set_title(title)
    ax.set_xticks(x)
    ax.set_xticklabels(x_labels)
    ax.legend()

    autolabel(ax, rects1)
    autolabel(ax, rects2)

    fig.tight_layout()
    plt.savefig(image_folder + image_name)


def chart_save_figure(image_name, x_labels, y_label, values):
    plt.subplots()
    height = values
    bars = x_labels
    y_pos = np.arange(len(bars))
    plt.bar(y_pos, height, color=(0.2, 0.4, 0.6, 0.6))
    plt.ylabel(y_label)
    plt.xticks(y_pos, bars)
    plt.tight_layout()
    plt.savefig(image_folder + image_name)


def autolabel(ax, rects):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')


def copy_date(date1: date):
    return date(year=date1.year, month=date1.month, day=date1.day)
