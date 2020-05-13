from django.db.models.functions import Coalesce

from my_utils.string_format import price_format

from mainapp.models import Shoe, Image, DetailShoe, Color, Category


def get_product_detail(shoe_id):
    shoe = Shoe.objects.get(id=shoe_id)
    shoe.viewCount = shoe.viewCount + 1
    shoe.save()

    images = Image.objects.filter(shoe=shoe)
    last_image = images[3]
    detailShoes = DetailShoe.objects.filter(shoe=shoe).filter(quantityAvailable__gt=0)
    colors = Color.objects.filter(detailshoe__shoe_id=shoe.id).distinct()
    category = Category.objects.filter(id=shoe.category.id).first()
    shoe_old_price = '{:,}'.format(DetailShoe.objects.filter(shoe_id=shoe_id).first().oldPrice).replace(',', '.')
    shoe_price = '{:,}'.format(DetailShoe.objects.filter(shoe_id=shoe_id).first().newPrice).replace(',', '.')
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
    return context


def get_related_shoes(shoe_id):
    context = {}
    current_shoe = Shoe.objects.filter(id=shoe_id).first()
    if current_shoe:
        related_shoes = Shoe.objects.filter(category_id=current_shoe.category_id).order_by(
            Coalesce('dateCreated', 'quantitySold').desc())[:5]
        related_shoes_new_price = {}
        for shoe in related_shoes:
            related_shoes_new_price[shoe.id] = price_format(DetailShoe.objects.filter(shoe_id=shoe.id).first().newPrice)
        context['related_shoes'] = related_shoes
        context['related_shoes_new_price'] = related_shoes_new_price
    return context


def search_shoes(key_word):
    shoes = Shoe.objects.filter(shoeName__icontains=key_word)
    return shoes
