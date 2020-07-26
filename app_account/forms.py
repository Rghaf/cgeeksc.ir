from django import forms
from django.forms import ModelForm
from django.contrib.auth.models import User
from app_account.models import Profile

class LoginForm(forms.Form):
    username = forms.CharField(max_length = 50, widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'نام کاربری خود را وارد کنید'}), label='نام کاربری')
    password = forms.CharField(max_length = 32, widget = forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'رمز عبور خود را وارد کنید'}), label='رمز عبور')

class RegisterForm(forms.Form):
    username = forms.CharField(max_length = 50, widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'نام کاربری خود را وارد کنید'}), label="نام کاربری")
    email = forms.EmailField(max_length = 50 ,widget = forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'ایمیل خود را وارد کنید'}), label="ایمیل")
    name = forms.CharField(max_length = 30, widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'نام خود را وارد کنید'}), label='نام')
    lname = forms.CharField(max_length = 30, widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'نام خانوادگی خود را وارد کنید'}), label='نام خانوادگی')
    password = forms.CharField(max_length = 32, widget = forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'رمز عبور خود را وارد کنید'}), label='رمز عبور')
    confirmpassword = forms.CharField(max_length = 32, widget = forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'رمز عبور خود را مجددا وارد کنید'}), label='تایید رمز عبور')

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = '__all__'

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['bio', 'image'] 

