from django import forms
from .models import(
    SalesOrder,SalesLineItem, Supplier,Category,UserProfile,Product
)
from djangoformsetjs.utils import formset_media_js
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.forms import formset_factory
class SupplierForm(forms.ModelForm):
    name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'name',
        'data-val': 'true',
        'maxlength': '50',
    }))
    address = forms.CharField(widget=forms.Textarea(attrs={
        'class': 'form-control',
        'id': 'address',
        'data-val': 'true',
        'maxlength': '255',
        'rows': '5', 
        'cols': '20',
    }))
    email = forms.CharField(widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'id': 'email',
        'data-val': 'true',
        'maxlength': '50',
        'pattern':'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$'
    }))
    phonenum = forms.CharField(required=False,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'phonenum',
        'pattern': '[0-9]{10}', 
        'title' : '10-digits phone number',
        'data-val': 'true',
        'aria-describedby' : 'basic-addon1',
        'placeholder': 'xxxxxxxxxx (Phone Number)',
        'maxlength': '10',
        'data-parsley-pattern-message':"This value should be a valid phone number"
    }))
    class Meta:
        model = Supplier
        fields = [
            'name',
            'address',
            'email',
            'phonenum',
        ]
class CategoryForm(forms.ModelForm):
    name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'name',
        'data-val': 'true',
        'maxlength': '50',
    }))
    description = forms.CharField(widget=forms.Textarea(attrs={
        'class': 'form-control',
        'id': 'description',
        'data-val': 'true',
        'maxlength': '255',
        'rows': '5', 
        'cols': '20',
    }))
    class Meta:
        model = Category
        fields = [
            'name',
            'description',
        ]
class ProductForm(forms.ModelForm):
    img = forms.FileField(required=False,widget=forms.ClearableFileInput(attrs={
        'type': 'file',
        'class': 'file',
        'id': 'img',
        'accept':'image/png, image/jpeg',
        'data-show-upload':'false',
        'data-show-caption':'true',
        'data-msg-placeholder':'Select {files} for upload...',
    }
    ))
    name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'name',
        'data-val': 'true',
        'maxlength': '50',
    }))
    brand = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'brand',
        'data-val': 'true',
        'maxlength': '50',
    }))
    description = forms.CharField(widget=forms.Textarea(attrs={
        'class': 'form-control',
        'id': 'description',
        'data-val': 'true',
        'maxlength': '255',
        'rows': '5', 
        'cols': '20',
    }))
    
    category = forms.Select(attrs={
        'data-val': 'true',
        'id': 'category',
    })
    
    supplier = forms.Select(attrs={
        'data-val': 'true',
        'id': 'supplier',
        })
    
    class Meta:
        model = Product
        fields = [
            'img',
            'name',
            'brand',
            'description',
            'category',
            'supplier'
        ]
        
class StockForm(forms.ModelForm):
    qty= forms.CharField(required=False,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id':'qty',
        'type':'number',
        'min':'0',
        'max':'9999',
        'value': '0',
        'readonly':''
        }))
    retail_price= forms.CharField( widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id':'retail_price',
        'type':'number',
        'min':'1',
        'step':"0.01",
        'max':'9999999'
        }))
    purch_price = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id':'purch_price',
        'type':'number',
        'min':'1',
        'step':"0.01",
        'max':'9999999'
    }))
    reorder_qty = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id':'reorder_qty',
        'type':'number',
        'min':'1',
        'step':"1",
        'max':'9999999'
    }))
    remarks = forms.CharField(required=False,widget=forms.Textarea(attrs={
        'class': 'form-control',
        'id': 'remarks',
        'data-val': 'true',
        'maxlength': '255',
        'rows': '5', 
        'cols': '20',
    }))
    class Meta:
        model = Product
        fields = [
            'qty',
            'retail_price',
            'purch_price',
            'reorder_qty',
            'remarks'
        ]
        
class UserProfileForm(forms.ModelForm):
    avatar = forms.FileField(required=False,widget=forms.ClearableFileInput(attrs={
        'type': 'file',
        'class': 'file',
        'id': 'avatar',
        'accept':'image/png, image/jpeg',
        'data-show-upload':'false',
        'data-show-caption':'true',
        'data-msg-placeholder':'Select {files} for upload...',
    }
    ))
    phonenum = forms.CharField(required=False,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'phonenum',
        'pattern': '[0-9]{10}',
        'title' : '10-digits phone number',
        'data-val': 'true',
        'aria-describedby' : 'basic-addon1',
        'placeholder': 'xxxxxxxxxx (Phone Number)',
        'maxlength': '10',
        'data-parsley-pattern-message':"This value should be a valid phone number"
    }))
    GENDER_CHOICE = (
        ('Male', 'Male'),
        ('Female', 'Female'),
    )
    gender = forms.ChoiceField(choices=GENDER_CHOICE,widget=forms.RadioSelect(attrs={
        'id': 'gender',
        'data-parsley-excluded':'true'
    }))
    class Meta:
        model = UserProfile
        fields = [
            'avatar',
            'phonenum',
            'gender',
        ]

class UserProfileForm1(forms.ModelForm):
    avatar = forms.FileField(required=False,widget=forms.ClearableFileInput(attrs={
        'type': 'file',
        'class': 'file',
        'id': 'avatar',
        'accept':'image/png, image/jpeg',
        'data-show-upload':'false',
        'data-show-caption':'true',
        'data-msg-placeholder':'Select {files} for upload...',
    }
    ))
    phonenum = forms.CharField(required=False,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'phonenum',
        'pattern': '[0-9]{10}',
        'title' : '10-digits phone number',
        'data-val': 'true',
        'aria-describedby' : 'basic-addon1',
        'placeholder': 'xxxxxxxxxx (Phone Number)',
        'maxlength': '10',
        'data-parsley-pattern-message':"This value should be a valid phone number"
    }))
    class Meta:
        model = UserProfile
        fields = [
            'avatar',
            'phonenum',
        ]
 
 #Default SignUpForm
class UserCreateForm(UserCreationForm):
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={   
                'id': 'username',             
                "class": "form-control",
                'data-parsley-minlength':'[8]', 
            }
        ))
    email = forms.CharField(widget=forms.EmailInput(attrs={
        'id': 'email',    
        'class': 'form-control',
        'data-val': 'true',
        'maxlength': '50',
        'pattern':'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$'
    }))
    password1 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                'id':'a-password1',
                'class':'form-control',
                'data-parsley-equalto':'#a-password2',
                'data-parsley-minlength':'[8]', 
                'data-parsley-uppercase':'1',
                'data-parsley-lowercase':'1',
                'data-parsley-number':'1',
                'data-parsley-special':'1'
            }
        ))
    password2 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                'id':'a-password2',
                'class':'form-control',
                'data-parsley-equalto':'#a-password1'
            }
        ))
    first_name = forms.CharField(widget=forms.TextInput(attrs={
        'id': 'first_name',
        'class': 'form-control',
        'data-val': 'true',
        'maxlength': '50',
    }))
    last_name = forms.CharField(widget=forms.TextInput(attrs={
        'id': 'last_name',
        'class': 'form-control',
        'data-val': 'true',
        'maxlength': '50',
    }))
    is_active=forms.CheckboxInput(attrs={
        'id': 'is_active',
        'class': 'class:form-control'}),   

    class Meta:
        model = User
        fields = ('username','email','password1','password2','first_name','last_name','is_active','is_superuser')
        

class UserUpdateForm(UserChangeForm):
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={   
                'id': 'username',             
                "class": "form-control"
            }
        ))
    email = forms.CharField(widget=forms.EmailInput(attrs={
        'id': 'email',    
        'class': 'form-control',
        'data-val': 'true',
        'maxlength': '50',
        'pattern':'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$'
    }))
    first_name = forms.CharField(widget=forms.TextInput(attrs={
        'id': 'first_name',
        'class': 'form-control',
        'data-val': 'true',
        'maxlength': '50',
    }))
    last_name = forms.CharField(widget=forms.TextInput(attrs={
        'id': 'last_name',
        'class': 'form-control',
        'data-val': 'true',
        'maxlength': '50',
    }))
    is_active=forms.CheckboxInput(attrs={
        'id': 'is_active',
        'class': 'class:form-control'}),   

    class Meta:
        model = User
        fields = ('username','email','first_name','last_name','is_active','is_superuser')
        
class SalesOrderForm(forms.Form):
    buyer_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'buyer_name',
        'data-val': 'true',
        'maxlength': '50',
    }))
    message = forms.CharField(required=False,widget=forms.Textarea(attrs={
        'class': 'form-control',
        'id': 'message',
        'maxlength': '255',
        'rows': '8', 
        'cols': '20'
    }))
    STATUS = (
        ('', '---------'),
        ('Pending', 'Pending'),
        ('Approved', 'Approved'),
    )
    status = forms.ChoiceField(required=True,choices=STATUS,widget=forms.Select(attrs={
        'id': 'status',
        'class': 'w-100'
    }))
        

class SalesLineItemForm(forms.ModelForm):
    class Media(object):
        js = formset_media_js + (
            # Other form media here
        )
    product_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'ml-1 hidden',
        'data-val': 'true',
        'maxlength': '50',
        'readonly':'',
        'size':'10'
    }))
    qty= forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control qty m-3',
        'type':'number',
        'min':'1',
        'max':'9999',
        'value': '0',
        'required':''
        }))
    price= forms.CharField(widget=forms.TextInput(attrs={
        'class': 'price hidden',
        'type':'number',
        'min':'1',
        'step':"0.01",
        'max':'9999999',
        'readonly':''
        }))
    product = forms.Select(attrs={
        'data-val': 'true',
    })
    class Meta:
        model = SalesLineItem
        fields = ('product_name','qty','price','product')
    
        
SalesLineItemFormset =  formset_factory(SalesLineItemForm, extra=0, can_delete = True, max_num = None)