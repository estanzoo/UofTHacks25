# admin.py
from django.contrib import admin
from .models import User, Group

class UserProfileAdmin(admin.ModelAdmin):
    # Explicitly list fields you want to show in the admin form
    fields = ['display_name', 'user_id', 'phone_number']  # Ensure phone_number is included

admin.site.register(User, UserProfileAdmin)

class GroupProfileAdmin(admin.ModelAdmin):
    # Explicitly list fields you want to show in the admin form
    fields = ['display_name', 'group_id', 'join_code', 'members']  # Ensure phone_number is included

admin.site.register(Group, GroupProfileAdmin)
