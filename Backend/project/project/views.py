from django.shortcuts import render
from django.http import JsonResponse
from .models import User, Group
from .serializers import UserSerializer, GroupSerializer
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

# Create your views here.

@api_view(['GET', 'POST'])
def user_list(request):
    if request.method == 'GET':
        users = User.objects.all()
        serializer = UserSerializer (users, many=True)
        print (serializer.data)  
        return JsonResponse ({'users':serializer.data})
    
    if request.method == 'POST':
        serializer = UserSerializer (data=request.data, many = True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status = status.HTTP_201_CREATED)
        else:
            return Response (status = status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'POST'])
def group_list(request):
    if request.method == 'GET':
        groups = Group.objects.all()
        serializer = GroupSerializer (groups, many=True)
        return JsonResponse ({'groups': serializer.data})
    
    if request.method == 'POST':
        serializer = GroupSerializer (data=request.data, many = True)
        print (serializer.is_valid())
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status = status.HTTP_201_CREATED)
        else:
            return Response (status = status.HTTP_400_BAD_REQUEST)