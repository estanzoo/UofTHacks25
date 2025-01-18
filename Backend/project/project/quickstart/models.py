from django.db import models

# Create your models here.
class User (AbstractUser):
    display_name = models.CharField(max_length=255, unique=False)
    user_id = models.CharField(max_length=255, unique=True)