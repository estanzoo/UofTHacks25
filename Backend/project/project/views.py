from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
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
        print("Get me a user list")
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status = status.HTTP_201_CREATED)
        else:
            return Response(status = status.HTTP_400_BAD_REQUEST)

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
        
@api_view(['POST'])
def add_user_to_group(request):
    try:
        group = Group.objects.get(id=request.POST.get("group_id"))
        print("adding user...")

        if group.members.contains(id=request.POST.get("user_id")):
           return Response(status=status.HTTP_400_BAD_REQUEST)
        
        group.members.add(id=request.POST.get("user_id"))
        return Response(status=status.HTTP_200_OK)
    except Group.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
@api_view(['POST'])
def remove_user_from_group(request):
    group_id = request.POST.get("group_id")
    user_id = request.POST.get("user_id")

    try:
        group = Group.objects.get(id=group_id)
        
        if group.members.contains(id=user_id):
            group.members.remove(id=user_id)
            return Response(status=status.HTTP_200_OK)
        
        return Response(status=status.HTTP_400_BAD_REQUEST)
    except Group.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
@api_view(['POST'])
def get_user_info(request):
    try:
        user = User.objects.get(user_id=request.POST.get("user_id"))
        user_info = UserSerializer(user)

        return JsonResponse(user_info.data)
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
@api_view(['POST'])
def create_user(request):
    if request.method == "POST":
        user_id = request.POST.get("user_id")
        name = request.POST.get("display_name", "John Doe")
        phone_number = request.POST.get("phone_number", "+1234567890")

        user = User.objects.create(user_id=user_id, display_name=name, phone_number=phone_number)

        user.save()

        return Response(status=status.HTTP_201_CREATED)
    return Response(status=status.HTTP_400_BAD_REQUEST)

