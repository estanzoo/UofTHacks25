from django.db import models

# Create your models here.
class User (AbstractUser):
    username = models.CharField(max_length=255, unique=True)
    full_name = models.CharField(max_length=255)
    password = models.CharField(blank=True, max_length=255)