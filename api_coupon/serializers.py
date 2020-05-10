from rest_framework import serializers

from coupon.models import Coupon


class CouponSerializer(serializers.ModelSerializer):
    coupon_id = serializers.SerializerMethodField('get_alternate_id_field_name')

    def get_alternate_id_field_name(self, obj):
        return obj.id

    class Meta:
        model = Coupon
        fields = (
            'coupon_id',
            'couponImage',
            'couponTitle',
            'couponCode',
            'expirationDate',
            'discountRate',
            'discountAmount',
            'couponAmount',
            'couponDescription',)
