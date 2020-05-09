from django.utils import timezone
from rest_framework import serializers
from account.models import User
from cart.models import Cart


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['messengerId', 'displayName']

    def create(self, validated_data):
        # user = super(UserSerializer, self).create(validated_data)
        user = User()
        user.username = validated_data['messengerId']
        user.set_password(validated_data['messengerId'])
        user.messengerId = validated_data['messengerId']
        user.displayName = validated_data['displayName']
        user.save()
        return user

    def is_exists(self):
        messenger_id = self.validated_data['messengerId']
        return User.objects.filter(messengerId=messenger_id).first() is not None

#
# class CartSerializer(serializers.ModelSerializer):
#     user_id = serializers.IntegerField()
#     detailShoe = serializers.IntegerField()
#     quantityOnCart = serializers.IntegerField()
#
#     class Meta:
#         model = Cart
#         fields = ('user', 'detailShoe', 'quantityOnCart')
#
#     def is_exists(self):
#         user_id = self.validated_data['messengerId']
#         # if User.objects.filter(messengerId=messenger_id).first() is not None:
#         #     return True
#         # else:
#         #     return False
