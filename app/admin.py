# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.contrib import admin

from app.forms import CategoryForm
from .models import (
    Supplier,UserProfile,Category,Product,Stock
)

# Register your models here.
class SupplierAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'address', 'email', 'phonenum', 'created_date']

admin.site.register(Supplier, SupplierAdmin)
admin.site.register(Category)
admin.site.register(UserProfile)
admin.site.register(Product)
admin.site.register(Stock)