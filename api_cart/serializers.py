
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
