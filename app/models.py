# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.db import models
from django.contrib.auth import get_user_model
from django_resized import ResizedImageField
# Create your models here.
User = get_user_model()

class Supplier(models.Model):
    name = models.CharField(max_length=50, null=False)
    address = models.CharField(max_length=255, null=False)
    email = models.CharField(max_length=50, null=False)
    phonenum = models.CharField(max_length=50, null=False, default=0)
    created_date = models.DateTimeField(auto_now_add=True, null=False)
    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=50, unique=True)
    description = models.CharField(max_length=255, null=False)
    created_date = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
    
class Product(models.Model):
    img = ResizedImageField(null=True, blank=True, upload_to='images/') 
    name = models.CharField(max_length=50, null=False)
    brand = models.CharField(max_length=50, null=False)
    description = models.CharField(max_length=255, null=False)
    category = models.ForeignKey(Category, on_delete=models.PROTECT)
    created_date = models.DateTimeField(auto_now_add=True, null=False)
    supplier = models.ForeignKey(Supplier, on_delete=models.PROTECT)
    def __str__(self):
        return self.name

class Stock(models.Model):
    qty = models.IntegerField(null=False)
    retail_price = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    purch_price = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    reorder_qty = models.IntegerField(null=False,default=0)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    def __str__(self):
        return self.product.name
    
class UserProfile(models.Model):
    GENDER_CHOICE = (
        ('Male', 'Male'),
        ('Female', 'Female'),
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phonenum = models.CharField(max_length=50, null=False, default=0)
    gender = models.CharField(max_length=10, choices=GENDER_CHOICE)
    avatar = ResizedImageField(null=True, blank=True, upload_to='images/') 

    def __str__(self):
        return self.user.email

class SalesOrder(models.Model):
    STATUS_CHOICE = (
        ('Pending', 'Pending'),
        ('Paid', 'Paid'),
    )
    buyer_name = models.CharField(max_length=50, null=False)
    date = models.DateField(null=False)
    due_date = models.DateField(null=False)
    message = models.TextField(null=True)
    total_amount = models.DecimalField(max_digits=11, decimal_places=2, null=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICE,default=False)
    created_date = models.DateTimeField(auto_now_add=True, null=False)
    def __str__(self):
        return self.buyer_name
    
class SalesLineItem(models.Model):
    sales = models.ForeignKey(SalesOrder, on_delete=models.CASCADE)
    product_name = models.CharField(max_length=50, null=False)
    qty = models.IntegerField(null=False)
    price = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    amount = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    product = models.ForeignKey(Product, on_delete=models.DO_NOTHING, null=True)
    
    def __str__(self):
        return self.product_name
    

class StockIn(models.Model):
    product_name = models.CharField(max_length=50, null=False)
    supplier_name = models.CharField(max_length=50, null=False)
    previous_qty = models.IntegerField(null=False)
    qty_added = models.IntegerField(null=False)
    total_qty = models.IntegerField(null=False)
    purch_price = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    total_purchase = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    remarks = models.CharField(max_length=255, null=False)
    created_date = models.DateTimeField(auto_now_add=True, null=False)
    encoder = models.CharField(max_length=50, null=False)
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.product_name

class StockOut(models.Model):
    product_name = models.CharField(max_length=50, null=False)
    supplier_name = models.CharField(max_length=50, null=False)
    previous_qty = models.IntegerField(null=False)
    qty_selled = models.IntegerField(null=False)
    qty_left = models.IntegerField(null=False)
    retail_price = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    total_sales = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    created_date = models.DateTimeField(auto_now_add=True, null=False)
    encoder = models.CharField(max_length=50, null=False)
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)
    
class StockPullOut(models.Model):
    product_name = models.CharField(max_length=50, null=False)
    supplier_name = models.CharField(max_length=50, null=False)
    previous_qty = models.IntegerField(null=False)
    qty_pullout = models.IntegerField(null=False)
    qty_left = models.IntegerField(null=False)
    purch_price = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    total_pullout = models.DecimalField(max_digits=11, decimal_places=2, null=False)
    remarks = models.CharField(max_length=255, null=False)
    created_date = models.DateTimeField(auto_now_add=True, null=False)
    encoder = models.CharField(max_length=50, null=False)
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)


    def __str__(self):
        return self.product_name