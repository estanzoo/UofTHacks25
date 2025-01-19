from rest_framework import serializers
from .models import User, Group

class UserSerializer (serializers.ModelSerializer):
    class Meta: 
        model = User
        fields = ['display_name', 'user_id', 'phone_number']

class GroupSerializer (serializers.ModelSerializer):
    class Meta: 
        model = Group
        fields = ['display_name', 'group_id', 'join_code']