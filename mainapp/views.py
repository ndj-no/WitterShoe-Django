from django.db.models.functions import Coalesce
from django.shortcuts import render

from favourite.models import Favourite
from my_utils import string_format
from . import product_detail_logic
from .models import *
from django.views import View
from django.template.defaulttags import register
from cart.models import Cart
from my_utils.string_format import price_format


class TopBarView(View):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.context = {}

    def update_top_bar(self, request):

        items_on_cart = 0
        total_products_price = 0

        if request and request.user.is_authenticated:
            user_id = request.user.id
            carts = Cart.objects.filter(user_id=user_id)
            items_on_cart = len(carts)
            if items_on_cart > 0:
                for cart in carts:
                    detail_shoe = cart.detailShoe
                    if detail_shoe.quantityAvailable > 0:
                        total_products_price += cart.quantityOnCart * detail_shoe.newPrice
        self.context.update({'items_on_cart': items_on_cart,
                             'total_products_price': price_format(total_products_price), })


class MainFrameView(TopBarView):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        nav_list_quantity_sold_shoes = Shoe.objects.order_by('quantitySold')[::-1][:3]
        nav_list_quantity_sold_shoes_price = {}
        for shoe in nav_list_quantity_sold_shoes:
            nav_list_quantity_sold_shoes_price[shoe.id] = '{:,}'.format(
                DetailShoe.objects.filter(shoe_id=shoe.id).first().newPrice).replace(',', '.')
        title = 'Witter - Shop giày cho giới trẻ'
        categories = Category.objects.all()[:7]

        context = {
            'title': title,
            'nav_list_quantity_sold_shoes': nav_list_quantity_sold_shoes,
            'nav_list_quantity_sold_shoes_price': nav_list_quantity_sold_shoes_price,
            'categories': categories,
        }
        self.context.update(context)


class IndexView(MainFrameView):
    def get(self, request):
        self.update_top_bar(request)
        # quantity sold
        rotate_shoes = Shoe.objects.order_by(Coalesce('quantitySold', 'favouriteCount').desc())[:3]
        rotate_shoes_first = Shoe.objects.order_by(Coalesce('quantitySold', 'favouriteCount').desc())[4]

        # new shoe
        # date created
        new_shoes1 = Shoe.objects.order_by(Coalesce('dateCreated', 'quantitySold').desc())[:4]
        new_shoes2 = Shoe.objects.order_by(Coalesce('dateCreated', 'quantitySold').desc())[4:8]

        # views
        span4_views_shoes = Shoe.objects.order_by(Coalesce('viewCount', 'dateCreated').desc())[:3]
        span4_views_shoes_price = {}
        for shoe in span4_views_shoes:
            span4_views_shoes_price[shoe.id] = '{:,}'.format(
                DetailShoe.objects.filter(shoe_id=shoe.id).first().newPrice).replace(',', '.')
        # liked , san pham ua thich
        most_liked_shoes = Shoe.objects.order_by(Coalesce('favouriteCount', 'viewCount').desc())[:3]
        most_liked_shoes_price = {}
        for shoe in most_liked_shoes:
            most_liked_shoes_price[shoe.id] = '{:,}'.format(
                DetailShoe.objects.filter(shoe_id=shoe.id).first().newPrice).replace(',', '.')

        context = {'rotate_shoes': rotate_shoes,
                   'rotate_shoes_first': rotate_shoes_first,
                   'new_shoes1': new_shoes1,
                   'new_shoes2': new_shoes2,
                   'span4_views_shoes': span4_views_shoes,
                   'span4_views_shoes_price': span4_views_shoes_price,
                   'most_liked_shoes': most_liked_shoes,
                   'most_liked_shoes_price': most_liked_shoes_price
                   }
        self.context.update(context)
        return render(request, 'mainapp/index.html', context=self.context)


class ProductDetailView(MainFrameView):
    def get(self, request, product_id):
        self.update_top_bar(request)

        context = product_detail_logic.get_product_detail(product_id)
        self.context.update(context)

        context = product_detail_logic.get_related_shoes(product_id)
        self.context.update(context)

        # check if user like this product or not
        user = request.user
        favorite = Favourite.objects.filter(user_id=user.id, shoe_id=product_id).first()
        if favorite:
            context['is_favourite'] = True
        else:
            context['is_favourite'] = False
        self.context.update(context)
        print(context['is_favourite'])
        return render(request, 'mainapp/product_details.html', context=self.context)


class ProductsByCategory(MainFrameView):

    def get(self, request):
        self.update_top_bar(request)
        ITEMS_PER_PAGE = 12

        search_key_word = request.GET.get('search', '')
        category_id = request.GET.get('category_id', '')
        top_sale = request.GET.get('top_sale', '')
        most_view = request.GET.get('most_view', '')
        most_favorite = request.GET.get('most_favorite', '')
        page = int(request.GET.get('page', 1))

        if page <= 0:
            page = 1

        # viet lai get parameter cho nut next, previous page
        prev_page = '?' + '&'.join([
            f'search={search_key_word}',
            f'category_id={category_id}',
            f'top_sale={top_sale}',
            f'most_view={most_view}',
            f'most_favorite={most_favorite}',
        ])
        next_page = prev_page + '&page=' + str(page + 1)
        prev_page = prev_page + '&page=' + str(page - 1)

        if search_key_word:
            shoes = product_detail_logic.search_shoes(search_key_word)
            category_name = f'Tìm kiếm "{search_key_word}"'
        else:
            category_name = 'Tất cả sản phẩm'
            shoes = Shoe.objects.all()
        if category_id:
            print(category_id)
            category = Category.objects.filter(id=category_id).first()
            if category is not None:
                category_name = category.categoryName
                shoes = shoes.filter(category_id=category_id)
                print(shoes)

        if top_sale:
            shoes = shoes.order_by(Coalesce('quantitySold', 'favouriteCount').desc())
            category_name = 'Sản phẩm bán chạy'

        if most_view:
            shoes = shoes.order_by(Coalesce('viewCount', 'quantitySold').desc())
            category_name = 'Sản phẩm xem nhiều'

        if most_favorite:
            shoes = shoes.order_by(Coalesce('favouriteCount', 'viewCount').desc())
            category_name = 'Sản phẩm được yêu thích'
        shoes = shoes[(page - 1) * ITEMS_PER_PAGE: page * ITEMS_PER_PAGE]

        self.context.update({'category_name': category_name, })

        # chia shoe thanh [[ 3 shoes ], ... n]
        # shape = (n, 3)
        if len(shoes) != 0:
            shoes_groups = [[]]
            shoes_price_new = {}
            shoes_image = {}
            count = 0
            for shoe in shoes:
                shoes_price_new[shoe.id] = price_format(DetailShoe.objects.filter(shoe_id=shoe.id).first().newPrice)
                shoes_image[shoe.id] = Image.objects.filter(shoe_id=shoe.id).first().shoeImage

                shoes_groups[-1].append(shoe)
                count += 1
                if count == 3:
                    shoes_groups.append([])
                    count = 0
            self.context.update({
                'shoes_groups': shoes_groups,
                'shoes_price_new': shoes_price_new,
                'shoes_image': shoes_image,
            })
        self.context.update({
            'prev_page': prev_page,
            'page': page,
            'next_page': next_page,
        })
        return render(request, 'mainapp/products.html', context=self.context)


@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)


@register.filter
def format_price(price):
    return string_format.price_format(price)


@register.filter
def format_float(value):
    return '{:.2f}'.format(value)
