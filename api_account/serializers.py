from rest_framework import serializers

from account.models import User


class UserInfoSerializer(serializers.ModelSerializer):
    user_id = serializers.SerializerMethodField('get_alternate_id_field_name')

    class Meta:
        model = User
        fields = ['user_id', 'displayName', 'defaultAddress', 'phone']

    def get_alternate_id_field_name(self, obj):
        return obj.id


class UserMessengerSerializer(serializers.ModelSerializer):
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
