from django.db.models.functions import Coalesce
from django.shortcuts import render
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
        title = 'WitterShoe'
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

        shoe = Shoe.objects.get(id=product_id)
        shoe.viewCount = shoe.viewCount + 1
        shoe.save()

        images = Image.objects.filter(shoe=shoe)
        last_image = images[3]
        detailShoes = DetailShoe.objects.filter(shoe=shoe).filter(quantityAvailable__gt=0)
        colors = Color.objects.filter(detailshoe__shoe_id=shoe.id).distinct()
        category = Category.objects.filter(id=shoe.category.id).first()
        shoe_old_price = '{:,}'.format(DetailShoe.objects.filter(shoe_id=product_id).first().oldPrice).replace(',', '.')
        shoe_price = '{:,}'.format(DetailShoe.objects.filter(shoe_id=product_id).first().newPrice).replace(',', '.')
        total_products_available = sum([d_shoe.quantityAvailable for d_shoe in detailShoes])
        context = {
            'shoe': shoe,
            'category': category,
            'images': images,
            'shoe_old_price': shoe_old_price,
            'shoe_price': shoe_price,
            'detailShoes': detailShoes,
            'last_image': last_image,
            'colors': colors,
            'total_products_available': total_products_available,
        }
        self.context.update(context)
        return render(request, 'mainapp/product_details.html', context=self.context)


class ProductsByCategory(MainFrameView):
    def get(self, request):
        self.update_top_bar(request)

        category_id = request.GET.get('category_id', None)
        page = request.GET.get('page', 1)
        category_name = 'Tất cả sản phẩm'
        if category_id is not None:
            category = Category.objects.filter(id=category_id).first()
            if category is not None:
                category_name = category.categoryName
            shoes = Shoe.objects.filter(category_id=category_id)
        else:
            shoes = Shoe.objects.all()
        self.context.update({'category_name': category_name, })
        # chia shoe thanh [[ 3 shoe ], ... n shoe]
        # shape = (n, 3)
        if len(shoes) != 0:
            shoes_groups = []
            shoes_price_new = {}
            shoes_image = {}
            group = []
            count = 0
            for shoe in shoes:
                group.append(shoe)
                shoes_price_new[shoe.id] = '{:,}'.format(
                    DetailShoe.objects.filter(shoe_id=shoe.id).first().newPrice).replace(',', '.')
                shoes_image[shoe.id] = Image.objects.filter(shoe_id=shoe.id).first().shoeImage
                count += 1
                if count % 3 == 0:
                    shoes_groups.append(group)
                    group = []
            self.context.update({
                'shoes_groups': shoes_groups,
                'shoes_price_new': shoes_price_new,
                'shoes_image': shoes_image,
            })
        return render(request, 'mainapp/products.html', context=self.context)


@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)
