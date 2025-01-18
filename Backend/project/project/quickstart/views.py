from django.shortcuts import render
from rest_framework import serializers
from .models import User

# Create your views here.

class RegisterUserSerializer (serializers.Serializer):
    