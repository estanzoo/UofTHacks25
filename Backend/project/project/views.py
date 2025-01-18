from django.shortcuts import render
from django.http import JsonResponse
from .models import User, Group
from .serializers import UserSerializer, GroupSerializer

# Create your views here.

def user_list(request):
    users = User.objects.all()
    serializer = UserSerializer (users, many=True)
    return JsonResponse (serializer.data)

def group_list(request):
    groups = Group.objects.all()
    serializer = GroupSerializer (data=groups, many=True)
    print(serializer.is_valid())
    return JsonResponse (serializer.data, safe = False)