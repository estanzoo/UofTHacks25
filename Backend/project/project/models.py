from django.db import models
import uuid

# Create your models here.
class User (models.Model):
    display_name = models.CharField(max_length=255)
    user_id = models.CharField(max_length=255, unique=True)


class Group (models.Model):
    display_name = models.CharField (max_length=255)
    group_id = models.CharField (max_length=255, unique=True)
    join_code = models.CharField (max_length=6, unique=True)
    members = models.ManyToManyField(User)