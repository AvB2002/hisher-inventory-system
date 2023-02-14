# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

import pdfkit
from django import template
register = template.Library()
from django.db.models import F, Func, Value, CharField
from django.contrib.auth.hashers import check_password,make_password
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.db.models import Sum
from django.shortcuts import render, reverse
from django.template import loader
from django.http import HttpResponse
from django import template
from django.contrib.admin.models import LogEntry, ADDITION, CHANGE
from django_serverside_datatable.views import ServerSideDatatableView
from django.http import JsonResponse
from django.core import serializers
from django.db.models import Count
from django.db.models.functions import TruncDate
from django.utils.dateformat import DateFormat
import datetime as dt
import calendar
from django.db.models.functions import TruncMonth
from django.contrib.auth.decorators import user_passes_test
from .models import (
    Supplier,Category,Product,Stock,UserProfile,StockIn,StockOut,StockPullOut,SalesOrder,SalesLineItem
)
from .forms import (
    SupplierForm,CategoryForm,UserProfileForm,UserProfileForm1,UserCreateForm,UserUpdateForm,ProductForm,StockForm,SalesLineItemForm,SalesOrderForm,SalesLineItemFormset
)
import json as simplejson
        
cloudinary_url = 'https://res.cloudinary.com/dennsqzoz/image/upload/v1642064650/'

def view_profile(request):
     return render(request,'pages/profile.html',{})
 
def about(request):
     return render(request,'homepage/about.html',{})

def contact(request):
     return render(request,'homepage/contact.html',{})
                   
#@login_required(login_url="/login/")
def index(request):
    if request.user.is_authenticated:
        today = dt.datetime.now()
        start_date = today - dt.timedelta(today.weekday())
        end_date = start_date + dt.timedelta(6)
        month_day=calendar.monthrange(today.year, today.month)[1]
        
        critical_stock = Stock.objects.filter(qty__lte=F("reorder_qty")).count()
        
        months = ['Zero','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
        current_month = months[today.month]
        
        product_count=Product.objects.all().count()
        
        weekly_sales=StockOut.objects.filter(created_date__date__range=[start_date, end_date]).aggregate(Sum('total_sales'))
        monthly_sales=StockOut.objects.filter(created_date__year=today.year, created_date__month=today.month).aggregate(Sum('total_sales'))
        
        weekly_purchase=StockIn.objects.filter(created_date__date__range=[start_date, end_date]).aggregate(Sum('total_purchase'))
        monthly_purchase=StockIn.objects.filter(created_date__year=today.year, created_date__month=today.month).aggregate(Sum('total_purchase'))
        
        weekly_order=SalesOrder.objects.filter(created_date__date__range=[start_date, end_date]).count()
        monthly_order=SalesOrder.objects.filter(created_date__year=today.year, created_date__month=today.month).count()
        
        total_stocks=Stock.objects.aggregate(Sum('qty'))
        product_log=Product.objects.all().prefetch_related('category', 'supplier').order_by('-created_date')[:10]
        
        
        stock_in=StockIn.objects.all().order_by('-created_date')[:10]
        stock_out=StockOut.objects.all().order_by('-created_date')[:10]    
        critical_stock_log=Stock.objects.select_related('product').values('product__name','qty').filter(qty__lte=F("reorder_qty"))[:10]
        
      
        top_sell_products=StockOut.objects.select_related('product').values('product__img','product_name','supplier_name', ).annotate(sum=Sum('total_sales')).order_by("product_name")
        top_pur_products=StockIn.objects.select_related('product').values('product__img','product_name','supplier_name').annotate(sum=Sum('total_purchase')).order_by('product_name')
        top_pull_products=StockPullOut.objects.select_related('product').values('product__img','product_name','supplier_name').annotate(sum=Sum('total_pullout')).order_by('product_name')
      
        tsp_count=top_sell_products.count()
        tpp_count=top_pur_products.count()
        tpullp_count=top_pull_products.count()
        
        
        year_list = []
        
        yearTmp = int(today.year)
        for y in range(1,100):
            year_list.append(yearTmp)
            yearTmp=yearTmp-1
        context = {
            'product_count': product_count,
            
            'monthly_sales': monthly_sales,
            'weekly_sales': weekly_sales,
            
            'monthly_purchase': monthly_purchase,
            'weekly_purchase': weekly_purchase,
            
            'monthly_order': monthly_order,
            'weekly_order': weekly_order,
            
            'start_date': start_date,
            'month_day': month_day,
            'end_date': end_date,
            'total_stocks': total_stocks,
            'product_log': product_log,
            'current_month': current_month,
            'critical_stock': critical_stock,
            'critical_stock_log': critical_stock_log,
            'stock_in': stock_in,
            'stock_out': stock_out,
            
            'top_sell_products': top_sell_products,
            'top_pur_products': top_pur_products,
            'top_pull_products': top_pull_products,
            
            'tsp_count': tsp_count,
            'tpp_count': tpp_count,
            'tpullp_count': tpullp_count,
            
            'year_list': year_list,
            'cloudinary_url': cloudinary_url
        }
        return render(request,'pages/dashboard.html',context)
    else:
        return render(request,'homepage/home.html',{})
    
def bar_chart(request):
    dateYear=request.GET.get('dateYear')
    months = ['Zero','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
    sales_bar_query = StockOut.objects.filter(created_date__year=dateYear).annotate(month=TruncMonth('created_date')).values('month').annotate(sum=Sum('total_sales')).order_by('month')   
    purchases_bar_query = StockIn.objects.filter(created_date__year=dateYear).annotate(month=TruncMonth('created_date')).values('month').annotate(sum=Sum('total_purchase')).order_by('month')   
        
    labels = []
    sales_data = []
    purchase_data = []
    for m in range(1,13):
        l=""
        d=0 
        for sales in sales_bar_query:
            if(str(DateFormat(sales['month']).format('M'))==months[m]):      
                l=DateFormat(sales['month']).format('M')
                d=int(sales['sum'])
        if(d==0):
            l=months[m]
        labels.append(l)
        sales_data.append(d)
            
    for m in range(1,13):
        l=""
        d=0 
        for purchase in purchases_bar_query:
            if(str(DateFormat(purchase['month']).format('M'))==months[m]):      
                l=DateFormat(purchase['month']).format('M')
                d=int(purchase['sum'])
        if(d==0):
            l=months[m]
        purchase_data.append(d)
    data = {
            'labels': labels,
            'sales_data': sales_data,
            'purchase_data': purchase_data,
        }
    return JsonResponse(data)

#product
@login_required(login_url="/login/")
def manage_product(request):
    form = ProductForm(request.POST)
    form1 = StockForm(request.POST)
    return render(request,'pages/manage-product.html',{'form' : form,'form1':form1,'cloudinary_url':cloudinary_url})


def insert_product(request):
    try: 
        if request.is_ajax and request.method == "POST":
            form = ProductForm(request.POST, request.FILES)
            if form.is_valid():
                instance=form.save()
                ser_instance = serializers.serialize('json', [ instance,])
                
                return JsonResponse({"instance": ser_instance}, status=200)
            else:
                return JsonResponse({"error": form.errors}, status=400)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)
    return JsonResponse({"error": "An error has occured"}, status=400)  

class product_list(ServerSideDatatableView):
	queryset = Product.objects.all().prefetch_related('category', 'stock', 'supplier')
	columns = ['id', 'img', 'name', 'brand', 'description', 'category__name', 'supplier__name', 'stock__qty', 'stock__reorder_qty', 'stock__purch_price', 'stock__retail_price','created_date','category__id','supplier__id']
 

def product_graph(request):
    queryset = Product.objects.annotate(tmp=TruncDate('created_date')).order_by('tmp').values('tmp').annotate(cd_count=Count('tmp'))
    cdc = list(queryset.values_list('cd_count', flat=True))
    date = list(queryset.values_list('created_date', flat=True))
    count = Product.objects.all().count()
    
    total_on_hand = Stock.objects.aggregate(Sum('qty'))
    need_reorder = Stock.objects.filter(qty__lte=F("reorder_qty")).count()
    suff_stock = Stock.objects.filter(qty__gt=F("reorder_qty")).count()
    stock = Stock.objects.all().count()
    print(stock)
    
    if(stock>count):
        new_product=stock-count
    elif(count>stock):
        new_product=count-stock
    else:
        new_product=count-stock
    
    if(stock==0):
        total_on_hand=0
        
    data = {
            'cdc': cdc,
            'date': date,
            'count': count,
            
            'total_on_hand': total_on_hand,
            'need_reorder': need_reorder,
            
            'new_product': new_product,
            
            'suff_stock': suff_stock
        }
    return JsonResponse(data)


def delete_product(request):
    try:
        if request.is_ajax or request.method == "GET":
            id1 = request.GET.get('id', None)
            Product.objects.get(id=id1).delete()
            data = {
                    'deleted': True
                }
            return JsonResponse(data)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)


def update_product(request):
    if request.is_ajax and request.method == "POST":
            id1 = request.POST.get('id', None)
            instance = Product.objects.get(id=id1)
            form = ProductForm(request.POST or None,request.FILES or None, instance=instance)           
            if form.is_valid():
                form.save()
                
                data = {
                    'updated': True
                }
                
                return JsonResponse(data)
    return JsonResponse({"error": "An error has occured"}, status=400)

#supplier
@login_required(login_url="/login/")
def insert_supplier(request):
    try:  
        if request.is_ajax and request.method == "POST":
            form = SupplierForm(request.POST)
            if form.is_valid():
                instance = form.save()
                ser_instance = serializers.serialize('json', [ instance, ])
                return JsonResponse({"instance": ser_instance}, status=200)
            else:
                return JsonResponse({"error": form.errors}, status=400)
    except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)
    return JsonResponse({"error": "An error has occured"}, status=400)


def update_supplier(request):
    
      # request should be ajax and method should be POST.
    if request.is_ajax and request.method == "POST":
            id1 = request.POST.get('id', None)
            name1 = request.POST.get('name', None)
            address1 = request.POST.get('address', None)
            phonenum1 = request.POST.get('phonenum', None)
            email1 = request.POST.get('email', None)

            supplier = Supplier.objects.get(id=id1)
            supplier.name = name1
            supplier.address = address1
            supplier.phonenum = phonenum1
            supplier.email = email1
            supplier.save()


            data = {
                'updated': True
            }
            
            return JsonResponse(data)

    # some error occured
    return JsonResponse({"error": "An error has occured"}, status=400)

def delete_supplier(request):
    try:
        if request.is_ajax or request.method == "GET":
            id1 = request.GET.get('id', None)
            Supplier.objects.get(id=id1).delete()
            data = {
                    'deleted': True
                }
            return JsonResponse(data)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)

@login_required(login_url="/login/")
def manage_supplier(request):
    # queryset=Supplier.objects.all()
    form = SupplierForm(request.POST)
    # return render(request,'pages/manage-supplier.html',{"supplier":list(queryset.values()),'form' : form})
    return render(request,'pages/manage-supplier.html',{'form' : form})

class supplier_list(ServerSideDatatableView):
	queryset = Supplier.objects.all()
	columns = ['id', 'name', 'address', 'email', 'phonenum', 'created_date']
 
def supplier_graph(request):
    queryset = Supplier.objects.annotate(tmp=TruncDate('created_date')).order_by('tmp').values('tmp').annotate(cd_count=Count('tmp'))
    cdc = list(queryset.values_list('cd_count', flat=True))
    date = list(queryset.values_list('created_date', flat=True))
    count = Supplier.objects.all().count()
    data = {
            'cdc': cdc,
            'date': date,
            'count': count,
        }
    return JsonResponse(data)

#category
@login_required(login_url="/login/")
def manage_category(request):
    form = CategoryForm(request.POST)
    return render(request,'pages/manage-category.html',{'form' : form})

def insert_category(request):
       # request should be ajax and method should be POST.
    try:   
        if request.is_ajax and request.method == "POST":
            # get the form data
            form = CategoryForm(request.POST)
            # save the data and after fetch the object in instance
            if form.is_valid():
                instance = form.save()
                # serialize in new participant object in json
                ser_instance = serializers.serialize('json', [ instance, ])
                # send to client side.
                return JsonResponse({"instance": ser_instance}, status=200)
            else:
                # some form errors occured.
                return JsonResponse({"error": form.errors}, status=400)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)
    # some error occured
    return JsonResponse({"error": "An error has occured"}, status=400)

class category_list(ServerSideDatatableView):
	queryset = Category.objects.all()
	columns = ['id', 'name', 'description', 'created_date']

def category_graph(request):
    count = Category.objects.all().count()
    queryset = Category.objects.annotate(tmp=TruncDate('created_date')).order_by('tmp').values('tmp').annotate(cd_count=Count('tmp'))
    cdc = list(queryset.values_list('cd_count', flat=True))
    date = list(queryset.values_list('created_date', flat=True))
    data = {
            'cdc': cdc,
            'date': date,
            'count': count
        }
    return JsonResponse(data)

def delete_category(request):
    try:
        if request.is_ajax or request.method == "GET":
            id1 = request.GET.get('id', None)
            Category.objects.get(id=id1).delete()
            data = {
                    'deleted': True
                }
            return JsonResponse(data)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)


def update_category(request):
    
      # request should be ajax and method should be POST.
    if request.is_ajax and request.method == "POST":
            id1 = request.POST.get('id', None)
            name1 = request.POST.get('name', None)
            description1 = request.POST.get('description', None)

            category = Category.objects.get(id=id1)
            category.name = name1
            category.description = description1
            category.save()

            data = {
                'updated': True
            }
            
            return JsonResponse(data)

    # some error occured
    return JsonResponse({"error": "An error has occured"}, status=400)

#user
@user_passes_test(lambda u: u.is_superuser, login_url="/login/")
def manage_user(request):
    # queryset=Supplier.objects.all()
    form = UserCreateForm(request.POST)
    form1 = UserProfileForm(request.POST)
    form2 = UserUpdateForm(request.POST)
    # return render(request,'pages/manage-supplier.html',{"supplier":list(queryset.values()),'form' : form})
    return render(request,'pages/manage-user.html',{'form' : form,'form1' : form1, 'form2' : form2,'cloudinary_url' : cloudinary_url})

def insert_user(request):
    try:
        if request.is_ajax and request.method == "POST":
            # get the form data
            
            form = UserCreateForm(request.POST or None)
            form1 = UserProfileForm(request.POST or None,request.FILES or None)
            # save the data and after fetch the object in instance

            if form.is_valid() and form1.is_valid():
                role=request.POST.get("role", None)
                user1 = form.save(commit=False)
                if(role=="Admin"):
                    user1.is_superuser=1
                    user1.is_staff=1
                else:
                    user1.is_staff=1
                user1.save()
                userprof = form1.save(commit=False)
                userprof.user=user1
                userprof.save()
                
                ser_instance = {
                    'saved': True
                }
                return JsonResponse({"instance": ser_instance}, status=200)
            else:
                return JsonResponse({"error": form.errors}, status=400)
    except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)
    return JsonResponse({"error": "An error has occured"}, status=400)

def delete_user(request):
    try:
        if request.is_ajax or request.method == "GET":
                id1 = request.GET.get('id', None)
                user=User.objects.get(id=id1)
                if(request.user.username!=user.username):
                    User.objects.get(id=id1).delete()
                    data = {
                            'deleted': True
                    }
                else:
                    data = {
                            'deleted': False
                    }
                return JsonResponse(data)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)

def update_user(request):
    try:
        if request.is_ajax and request.method == "POST":
            # get the form data
            id1=request.POST.get('id',None)
            password1=request.POST.get('password1', None)
            confpassword=request.POST.get('confpassword1', None)
            
            instance=User.objects.get(id=id1)
            form = UserUpdateForm(request.POST or None, instance=instance)
            form1 = UserProfileForm1(request.POST or None,request.FILES or None,  instance=instance.userprofile)
            # save the data and after fetch the object in instance
            bypass=False
            if(password1=="") and (confpassword==""):
                bypass=True
            elif(password1!="") and (confpassword==""):
                return JsonResponse({"error": "Please confirm your password to validate and update the User Information!"}, status=400)
            if check_password(confpassword, instance.password) or (bypass==True):
                if form.is_valid() and form1.is_valid():
                    role=request.POST.get("role", None)
                    user1 = form.save(commit=False)
                    if(role=="Admin"):
                        user1.is_superuser=1
                        user1.is_is_staff=1
                    else:
                        user1.is_staff=1
                        user1.is_superuser=0
                    if(password1!="") and (confpassword!=""):
                        user1.password=make_password(password1)
                    user1.save()
                    userprof = form1.save(commit=False)
                    userprof.user=user1
                    userprof.save()
                    
                    ser_instance = {
                        'updated': True
                    }
                    
                    return JsonResponse({"instance": ser_instance}, status=200)
                else:
                    return JsonResponse({"error": form.errors}, status=400)
            else:
                 return JsonResponse({"error": "Invalid Password!"}, status=400)
    except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)
    return JsonResponse({"error": "An error has occured"}, status=400)

class user_list(ServerSideDatatableView):
	queryset = UserProfile.objects.prefetch_related("user", "group").all()
	columns = ['user__id', 'avatar', 'user__first_name', 'user__last_name', 'user__username', 'user__password', 'gender', 'user__email', 'phonenum', 'user__date_joined', 'user__is_superuser', 'user__is_active']
 
def user_graph(request):
    userpquery = UserProfile.objects.prefetch_related('user')
    queryset =userpquery.annotate(tmp=TruncDate('user__date_joined')).order_by('tmp').values('tmp').annotate(cd_count=Count('tmp'))
    cdc = list(queryset.values_list('cd_count', flat=True))
    date = list(queryset.values_list('user__date_joined', flat=True))
    count = UserProfile.objects.all().count()
    data = {
            'cdc': cdc,
            'date': date,
            'count': count,
        }
    return JsonResponse(data)

#stock

def update_stock(request):
      # request should be ajax and method should be POST.
    if request.is_ajax and request.method == "POST":
            id1 = request.POST.get('id', None)
            qty1 = request.POST.get('qty', None)
            retail_price1 = request.POST.get('retail_price', None)
            purch_price1 = request.POST.get('purch_price', None)
            reorder_qty1 = request.POST.get('reorder_qty', None)
            remarks1 = request.POST.get('remarks', None)

            sid=Stock.objects.filter(product__id=id1)
            prev_qty = request.POST.get('prev_qty', None)
            qty_adj = request.POST.get('qty_adj', None)
            adjustment = request.POST.get('adjustment', None)


            if sid.count() > 0:
                stock = Stock.objects.get(product__id=id1)
                stock.qty = qty1
                stock.retail_price = retail_price1
                stock.purch_price = purch_price1
                stock.reorder_qty = reorder_qty1
                stock.save()
                
                data = {
                    'saved': True
                }
                
                if(int(qty_adj)>0):
                    product=Product.objects.prefetch_related("supplier").get(id=stock.product_id)
                    total=float(stock.purch_price)*int(qty_adj)
                    if(adjustment=="Stock-In" and qty_adj != 0) and qty_adj!=0:
                        StockIn(product=product,product_name=product.name,
                            supplier_name=product.supplier, previous_qty= prev_qty, qty_added=qty_adj, total_qty=qty1, 
                            purch_price=purch_price1, total_purchase=total, remarks=remarks1, encoder=request.user.username).save()
                    elif(adjustment=="Stock-Pull-Out" and qty_adj != 0) and qty_adj!=0:
                        StockPullOut(product=product,product_name=product.name,
                            supplier_name=product.supplier, previous_qty= prev_qty, qty_pullout=qty_adj, qty_left=qty1, 
                            purch_price=purch_price1, total_pullout=total, remarks=remarks1, encoder=request.user.username).save()
                    
                    
                return JsonResponse(data)
            else:
                stock_in = Stock(qty=qty1,retail_price=retail_price1,purch_price=purch_price1,reorder_qty=reorder_qty1,product=Product.objects.get(id=id1))
                stock_in.save()
                

                data = {
                    'updated': True
                }
                
                if(int(qty_adj)>0):
                    product=Product.objects.prefetch_related("supplier").get(id=stock_in.product_id)
                    total=float(stock_in.purch_price)*int(qty_adj)
                    if(adjustment=="Stock-In" and qty_adj != 0) and qty_adj!=0:
                        StockIn(product=product,product_name=product.name,
                            supplier_name=product.supplier, previous_qty= prev_qty, qty_added=qty_adj, total_qty=qty1, 
                            purch_price=purch_price1, total_purchase=total, remarks=remarks1, encoder=request.user.username).save()
                    elif(adjustment=="Stock-Pull-Out" and qty_adj != 0) and qty_adj!=0:
                        StockPullOut(product=product,product_name=product.name,
                            supplier_name=product.supplier, previous_qty= prev_qty, qty_pullout=qty_adj, qty_left=qty1, 
                            purch_price=purch_price1, total_pullout=total, remarks=remarks1, encoder=request.user.username).save()
           
                return JsonResponse(data)

    # some error occured
    return JsonResponse({"error": "An error has occured"}, status=400)

#report
@user_passes_test(lambda u: u.is_superuser, login_url="/login/")
def purchases_report(request):
    stock_in_log = StockIn.objects.all()
    context={
        'stock_in_log': stock_in_log
    }
    print(stock_in_log)
    return render(request,'pages/purchases-report.html',context)

@user_passes_test(lambda u: u.is_superuser, login_url="/login/")
def sales_report(request):
    stock_out_log = StockOut.objects.all()
    context={
        'stock_out_log': stock_out_log
    }
    return render(request,'pages/sales-report.html',context)

@user_passes_test(lambda u: u.is_superuser, login_url="/login/")
def stock_adj_report(request):
    stock_pullout_log = StockPullOut.objects.all()
    context={
        'stock_pullout_log': stock_pullout_log
    }
    return render(request,'pages/stock-adj-report.html',context)

#sales-order
def sales_orders_graph(request):
    count = SalesOrder.objects.all().count()
    queryset = SalesOrder.objects.annotate(tmp=TruncDate('created_date')).order_by('tmp').values('tmp').annotate(cd_count=Count('tmp'))
    cdc = list(queryset.values_list('cd_count', flat=True))
    date = list(queryset.values_list('created_date', flat=True))
    
    approved = SalesOrder.objects.filter(status='Approved').count()
    pending = SalesOrder.objects.filter(status='Pending').count()
    cancelled = SalesOrder.objects.filter(status='Cancelled').count()
    data = {
            'cdc': cdc,
            'date': date,
            'count': count,
            
            'approved': approved,
            'pending': pending,
            'cancelled': cancelled
        }
    return JsonResponse(data)

@login_required(login_url="/login/")
def add_sales_order(request):
    from django.shortcuts import redirect
    from django.contrib import messages
    if request.method == 'GET':
        formset = SalesLineItemFormset(request.GET or None)
        form = SalesOrderForm(request.GET or None)
    elif request.method == 'POST':
        formset = SalesLineItemFormset(request.POST)
        form = SalesOrderForm(request.POST)
        
        if form.is_valid() and formset.is_valid():
            sales_order = SalesOrder.objects.create(buyer_name=form.data ["buyer_name"],
                    date=form.data["date"],
                    due_date=form.data["due_date"], 
                    message=form.data["message"])
            total = 0
            status = form.data["status"]
            for form1 in formset:
                deleted = form1.cleaned_data.get('DELETE')
                if(form1.is_valid and deleted==False):
                    product1 = form1.cleaned_data.get('product')
                    product_name1 = form1.cleaned_data.get('product_name')
                    qty1 = form1.cleaned_data.get('qty')
                    price1 = form1.cleaned_data.get('price')
                    print(form1)
                    if product_name1 and qty1 and price1:
                        amount1 = float(price1)*int(qty1)
                        total += amount1
                        SalesLineItem(sales=sales_order,
                                            product_name=product_name1,
                                            qty=qty1,
                                            price=price1,
                                            amount=amount1,product=product1).save()
                        if(status=='Approved'):
                            stock=Stock.objects.get(product=product1)
                            qty_left1 = int(stock.qty) - int(qty1)
                            total_sales1 =  float(stock.retail_price) * int(qty1)
                            product=Product.objects.prefetch_related("supplier").get(id=stock.product_id)
                            StockOut(product=product,product_name=product.name,
                                supplier_name=product.supplier, previous_qty=stock.qty, qty_selled=qty1, qty_left=qty_left1, 
                                retail_price=stock.retail_price, total_sales=total_sales1, encoder=request.user.username).save()
                            stock.qty = qty_left1
                            stock.save()
            sales_order.status = status
            sales_order.total_amount = total 
            sales_order.save()
            message = 'Customer: ' + form.data ["buyer_name"] + '<br>Date: ' + form.data ["date"] + '<br>Due-Date: ' + form.data ["due_date"] + '<br>Message:<br> ' + form.data ["message"] + '<br>Status: ' + form.data ["status"] + "<br><i class='fas fa-angle-double-right'></i>  <a class='text-white' href='manage-order'>View Sales Order</a>"
            request.session['status'] = form.data ["status"]
            messages.success(request,message)
            return redirect('/sales-order/add-order')
    product=Stock.objects.select_related('product').values('product__id','product__name','product__supplier__name', 'product__brand','product__img').filter(qty__gte=1)
    context = {
            "form": form,
            "formset": formset,
            "product":product,
            'cloudinary_url':cloudinary_url
    }   
    return render(request,'pages/add-sales-order.html',context)

@login_required(login_url="/login/")
def manage_sales_order(request):
    today = dt.datetime.now()
    status=request.GET.get('status',None)
    SalesOrder.objects.all().filter(due_date__lt=today).exclude(status='Approved').update(status='Cancelled')
    if(status=='All' or status ==None):
        sales_order = SalesOrder.objects.all()
        status='All'
    else:
        sales_order = SalesOrder.objects.all().filter(status=status)
    lineitem = SalesLineItem.objects.all()
    context={
        'sales_order': sales_order,
        'lineitem': lineitem,
        'status': status,
        'range': range(4),
    }
    return render(request,'pages/manage-sales-order.html',context)


class sales_order_list(ServerSideDatatableView):
	queryset = SalesOrder.objects.all()
	columns = ['id','buyer_name','date','due_date','message','total_amount','status']
 

def get_product(request):
    id=request.GET.get('id', None)
    product = Product.objects.filter(id=id)
    producttmp = Product.objects.get(id=id)
    supplier = Supplier.objects.filter(id=producttmp.supplier_id)
    stock = Stock.objects.prefetch_related('product').filter(product__id=id)
    productdata = serializers.serialize('json', list(product))
    stockdata = serializers.serialize('json', list(stock))
    supplierdata = serializers.serialize('json', list(supplier))
    data = simplejson.dumps([productdata, stockdata, supplierdata])
    return JsonResponse(data, safe=False) 

def view_PDF(request, id):
    print(id)
    sales_order = SalesOrder.objects.get(id=id)
    lineitem = SalesLineItem.objects.filter(sales=id)
    context = {
        "id": sales_order.id,
        "total_amount": sales_order.total_amount,
        "customer": sales_order.buyer_name,
        "message": sales_order.message,
        "date": sales_order.date,
        "due_date": sales_order.due_date,
        "status": sales_order.status,
        "lineitem": lineitem,
    }
    return render(request, 'pages/pdf_template.html', context)


def generate_PDF(request, id):
    # Use False instead of output path to save pdf to a variable
    pdf = pdfkit.from_url(request.build_absolute_uri(reverse('so-detail', args=[id])), False)
    response = HttpResponse(pdf,content_type='application/pdf; charset=UTF-8')
    response['Content-Disposition'] = 'attachment; filename="hisher-invoice.pdf"'
    
    return response

def update_order_status(request):
    id=request.GET.get('id', None)
    status=request.GET.get('status', None)
    SalesOrder.objects.all().filter(id=id).update(status=status)
    if(status=='Approved'):
        lineitem=SalesLineItem.objects.filter(sales=id)
        for item in lineitem:
            stock = Stock.objects.get(product__id=item.product_id)
            qty1=item.qty
            qty_left1 = int(stock.qty) - int(qty1)
            total_sales1 =  float(stock.retail_price) * int(qty1)
            product=Product.objects.prefetch_related("supplier").get(id=item.product_id)
            StockOut(product=product,product_name=product.name,
                supplier_name=product.supplier, previous_qty=stock.qty, qty_selled=qty1, qty_left=qty_left1, 
                retail_price=stock.retail_price, total_sales=total_sales1, encoder=request.user.username).save()
            stock.qty = qty_left1
            stock.save()
    data = {
        'status': status,
        'id': id
    }
    return JsonResponse(data, safe=False) 

#@login_required(login_url="/login/")
#def pages(request):
    context = {}
    # All resource paths end in .html.
    # Pick out the html file name from the url. And load that template.
    try:
        load_template      = request.path.split('/')[-1]
        context['segment'] = load_template
        html_template = loader.get_template( load_template )
        return HttpResponse(html_template.render(context, request))
        
    except template.TemplateDoesNotExist:

        html_template = loader.get_template( 'page-404.html' )
        return HttpResponse(html_template.render(context, request))

    except:
    
        html_template = loader.get_template( 'page-500.html' )
        return HttpResponse(html_template.render(context, request))


