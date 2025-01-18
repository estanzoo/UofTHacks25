from rest_framework import serializers
from .models import User, Group

class UserSerializer (serializers.Serializer):
    display_name = serializers.CharField (max_length=255)
    user_id = serializers.CharField (max_length=255)

class GroupSerializer (serializers.Serializer):
    display_name = serializers.CharField (max_length=255)
    group_id = serializers.CharField (max_length=255)
    join_code = serializers.CharField (max_length=6)