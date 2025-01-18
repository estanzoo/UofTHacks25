from django.db import models
from django.contrib.auth.models import AbstractUser
import uuid

# Create your models here.
class User (AbstractUser):
    display_name = models.CharField(max_length=255, unique=False)
    user_id = models.CharField(max_length=255, unique=True)

    def user_init(self):
        self.user_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    