from typing import Text


def price_format(price) -> Text:
    return '{:,}'.format(price).replace(',', '.')
