# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.urls import path, re_path
from django.conf.urls import url

from .views import (
  index,
  bar_chart,
  manage_product,
  insert_product,
  product_list,
  product_graph,
  update_product,
  delete_product,
  insert_supplier,
  manage_supplier,
  delete_supplier,
  update_supplier,
  supplier_list,
  supplier_graph,
  manage_category,
  insert_category,
  category_list,
  category_graph,
  delete_category,
  update_category,
  manage_user,
  insert_user,
  user_list,
  update_stock,
  delete_user,
  purchases_report,
  sales_report,
  user_graph,
  update_user,
  about,
  contact,
  view_profile,
  add_sales_order,
  manage_sales_order,
  sales_order_list,
  get_product,
  view_PDF,
  generate_PDF,
  sales_orders_graph,
  update_order_status,
  stock_adj_report
)

urlpatterns = [

    # The home page
    path('', index, name='home'),
    path('bar-chart', bar_chart, name='bar-chart'),
    path('about', about, name='about'),
    path('contact', contact, name='contact'),
    
    # product 
    path('manage-product/', manage_product, name='manage-product'),
    path('insert/product/', insert_product, name='insert-product'),
    path('product/list/', product_list.as_view(), name='product-list'),
    path('product/graph/', product_graph, name='product-graph'),
    path('delete/product/', delete_product, name='delete-product'),
    path('update/product/', update_product, name='update-product'),
    path('update/stock/', update_stock, name="update-stock"),
    
    # supplier 
    path('manage-supplier/', manage_supplier, name='manage-supplier'),
    path('supplier/list/', supplier_list.as_view(), name='supplier-list'),
    path('supplier/graph/', supplier_graph, name='supplier-graph'),
    url('insert/supplier/', insert_supplier, name='insert-supplier'),
    path('delete/supplier/', delete_supplier, name="delete-supplier"),
    path('update/supplier/', update_supplier, name="update-supplier"),

    # category
    path('manage-category/', manage_category, name='manage-category'),
    path('category/list/', category_list.as_view(), name='category-list'),
    path('insert/category/', insert_category, name='insert-category'),
    path('category/graph/', category_graph, name='category-graph'),
    path('delete/category/', delete_category, name='delete-category'),
    path('update/category/', update_category, name='update-category'),
    
    # user
    path('manage-user/', manage_user, name='manage-user'),
    path('insert/user/', insert_user, name='insert-user'),
    path('delete/user/', delete_user, name='delete-user'),
    path('user/list/', user_list.as_view(), name='user-list'),
    path('user/graph/', user_graph, name='user-graph'),
    path('update/user/', update_user, name='update-user'),

   # report
   path('report/purchases-report/', purchases_report, name='purchases-report'),
   path('report/sales-report/', sales_report, name='sales-report'),
   path('report/stock-adjustment-report/', stock_adj_report, name='stock-adj-report'),
   
   #profile
   path('view/profile', view_profile, name='view-profile'),
   
   #sales order
   path('sales-order/add-order', add_sales_order, name='add-sales-order'),
   path('sales-order/manage-order', manage_sales_order, name='manage-sales-order'),
   path('sales-order/get/product', get_product, name='get-product'),
   path('sales-order/list/', sales_order_list.as_view(), name='sales-order-list'),
   path('so-detail/<id>', view_PDF, name='so-detail'),
   path('so-detail/<id>', generate_PDF, name='so-download'),
   path('sales-orders/graph/', sales_orders_graph, name='sales-orders-graph'),
   path('update/status/', update_order_status, name='update-order-status'),
  
    # Matches any html file
    
  #re_path(r'^.*\.*', pages, name='pages'),

]

