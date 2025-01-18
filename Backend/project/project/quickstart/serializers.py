from rest_framework import serializers
from .models import User, Group

class UserSerializer (serializers.Serializer):
    class Meta:
        model = User
        fields = ["display_name", "user_id"]

class GroupSerializer (serializers.Serializer):
    class Meta:
        model = Group
        fields = ["display_name", "group_id", "join_code"]