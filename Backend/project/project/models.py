from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
import uuid

# Create your models here.
class User (models.Model):
    display_name = models.CharField(max_length=255)
    user_id = models.CharField(max_length=255, unique=True)
    phone_number = PhoneNumberField(blank = False, null = False, unique = False, default = '0000000000')


class Group (models.Model):
    display_name = models.CharField (max_length=255)
    group_id = models.CharField (max_length=255, unique=True)
    join_code = models.CharField (max_length=6, unique=True)
    members = models.ManyToManyField(User, related_name='users')