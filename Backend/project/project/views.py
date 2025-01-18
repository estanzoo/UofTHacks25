from django.shortcuts import render
from django.http import JsonResponse
from .models import User, Group
from .serializers import UserSerializer, GroupSerializer
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

# Create your views here.

def user_list(request):
    users = User.objects.all()
    serializer = UserSerializer (users, many=True)
    return JsonResponse ({'users':serializer.data})

@api_view(['GET', 'POST'])
def group_list(request):
    if request.method == 'GET':
        groups = Group.objects.all()
        serializer = GroupSerializer (groups, many=True)
        return JsonResponse ({'groups': serializer.data})
    
    if request.method == 'POST':
        serializer = GroupSerializer (data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status = status.HTTP_201_CREATED)