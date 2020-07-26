from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse
from django.contrib import messages
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.edit import FormView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from app_blog.models import Post, Category, Slider, Comment, Contact
from app_event.models import Event
from app_account.models import Profile
from app_project.models import Project, PCategory
from app_account.mixins import PostFieldsMixin, PostValidMixin, CategoryFieldsMixin, EventFieldsMixin, UpdatePostMixin, DeletePostMixin, ProfileEditMixin, UpdateCategoryMixin, UpdateEventMixin, DeleteCategoryMixin, DeleteEventMixin, SliderFieldsMixin, UpdateSliderMixin, DeleteSliderMixin, CommentFieldsMixin, UpdateCommentMixin, DeleteCommentMixin, DeleteContactMixin, PCategoryFieldsMixin, UpdatePCategoryMixin, DeletePCategoryMixin, ProjectFieldsMixin, UpdateProjectMixin, DeleteProjectMixin
from app_account.forms import UserForm, ProfileForm, LoginForm, RegisterForm
# Create your views here.

def loginview(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            user = authenticate(request, username=cd['username'], password=cd['password'])
            if user is not None:
                login(request, user)
                messages.success(request, 'شما با موفقیت وارد شدید', 'success')
                return redirect('app-blog:home')
            else:
                messages.error(request, 'نام کاربری یا رمز عبور اشتباه است', 'danger')
    else:
        form = LoginForm()
    return render(request, 'registration/login.html', {'form': form})

def registerview(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            if cd['password'] == cd['confirmpassword']:
                user = User.objects.create_user(
                    username=cd['username'],
                    email=cd['email'],
                    first_name=cd['name'],
                    last_name=cd['lname'],
                    password=cd['password']
                    )
                p = Profile(user=user)
                p.save()
                messages.success(request, 'ثبت نام با موفقیت انجام شد', 'success')
                return redirect('app-account:login')
    else:
        form = RegisterForm()
    return render(request, 'registration/register.html', {'form': form})

def logoutview(request):
    logout(request)
    messages.success(request, 'شما با موفقیت خارج شدید', 'success')
    return redirect('app-blog:home')

def profile(request, username):
    ctx = {}
    user = User.objects.get(username=username)
    post_list = Post.objects.all().filter(user=user)
    page = request.GET.get('page', 1)
    paginator = Paginator(post_list, 3)
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)
    ctx['Post'] = posts
    ctx['User'] = user
    return render(request, 'profile.html', ctx)

@login_required(redirect_field_name='login')
def dashboard(request):
    ctx = {}
    if request.user.profile.is_admin:
        ctx['Post'] = Post.objects.all().order_by('-id')
    else:
        ctx['Post'] = Post.objects.filter(user = request.user).order_by('-id')
    return render(request, 'registration/admin-dashboard.html', ctx)

@login_required(redirect_field_name='login')
def draftposts(request):
    ctx = {}
    if request.user.profile.is_admin:
        ctx['Post'] = Post.objects.filter(status = 'draft').order_by('-id')
        return render(request, 'registration/list/draftposts.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')

@login_required(redirect_field_name='login')
def myposts(request):
    ctx = {}
    ctx['Post'] = Post.objects.filter(user=request.user).order_by('-id')
    return render(request, 'registration/list/myposts.html', ctx)

@login_required(redirect_field_name='login')
def catdashboard(request):
    ctx = {}
    ctx['Category'] = Category.objects.all().order_by('-id')
    return render(request, 'registration/list/category.html', ctx)

@login_required(redirect_field_name='login')
def eventdashboard(request):
    ctx = {}
    ctx['Event'] = Event.objects.all().order_by('-id')
    return render(request, 'registration/list/event.html', ctx)

@login_required(redirect_field_name='login')
def finishedevents(request):
    ctx = {}
    ctx['Event'] = Event.objects.filter(status="a").order_by('-id')
    return render(request, 'registration/list/finishedevents.html', ctx)

@login_required(redirect_field_name='login')
def comments(request):
    ctx = {}
    ctx['Comment'] = Comment.objects.all().order_by('-id')
    return render(request, 'registration/list/comments.html', ctx)

@login_required(redirect_field_name='login')
def draftcomments(request):
    ctx = {}
    ctx['Comment'] = Comment.objects.filter(status="d").order_by('-id')
    return render(request, 'registration/list/draftcomments.html', ctx)

class PostCreateView(LoginRequiredMixin, PostFieldsMixin, PostValidMixin, CreateView):
    model = Post
    template_name = 'registration/add/addpost.html'
    success_url = reverse_lazy('app_account:dashboard')

class CategoryCreateView(LoginRequiredMixin, CategoryFieldsMixin, CreateView):
    model = Category
    template_name = 'registration/add/addcategory.html'
    success_url = reverse_lazy('app_account:dashboard')

class EventCreateView(LoginRequiredMixin, EventFieldsMixin, CreateView):
    model = Event
    template_name = 'registration/add/addevent.html'
    success_url = reverse_lazy('app_account:dashboard')

class PostUpdateView(LoginRequiredMixin, PostFieldsMixin, PostValidMixin, UpdatePostMixin, UpdateView):
    model = Post
    template_name = 'registration/add/addpost.html'
    success_url = reverse_lazy('app_account:dashboard')

class CategoryUpdateView(LoginRequiredMixin, CategoryFieldsMixin, UpdateCategoryMixin, UpdateView):
    model = Category
    template_name = 'registration/add/addcategory.html'
    success_url = reverse_lazy('app_account:dashboard')

class EventUpdateView(LoginRequiredMixin, EventFieldsMixin, UpdateEventMixin, UpdateView):
    model = Event
    template_name = 'registration/add/addevent.html'
    success_url = reverse_lazy('app_account:dashboard')

class PostDeleteView(LoginRequiredMixin, DeletePostMixin, DeleteView):
    model = Post
    success_url = reverse_lazy('app_account:dashboard')

class CategoryDeleteView(LoginRequiredMixin, DeleteCategoryMixin, DeleteView):
    model = Category
    success_url = reverse_lazy('app_account:dashboard')

class EventDeleteView(LoginRequiredMixin, DeleteEventMixin, DeleteView):
    model = Event
    success_url = reverse_lazy('app_account:dashboard')

class ProfileView(LoginRequiredMixin, ProfileEditMixin, FormView, UpdateView):
    model = Profile
    template_name = 'registration/profile.html'

def sliders(request):
    ctx = {}
    if request.user.profile.is_admin:
        ctx['Slider'] = Slider.objects.all().order_by('-id')
        return render(request, 'registration/list/slides.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')

class SliderCreateView(LoginRequiredMixin, SliderFieldsMixin, CreateView):
    model = Slider
    template_name = 'registration/add/addslide.html'
    success_url = reverse_lazy('app_account:dashboard')

class SliderUpdateView(LoginRequiredMixin, SliderFieldsMixin, UpdateSliderMixin, UpdateView):
    model = Slider
    template_name = 'registration/add/addslide.html'
    success_url = reverse_lazy('app_account:dashboard')

class SlideDeleteView(LoginRequiredMixin, DeleteSliderMixin, DeleteView):
    model = Slider
    success_url = reverse_lazy('app_account:dashboard')

class CommentUpdateView(LoginRequiredMixin, CommentFieldsMixin, UpdateCommentMixin, UpdateView):
    model = Comment
    template_name = 'registration/add/editcomment.html'
    success_url = reverse_lazy('app_account:dashboard')

class CommentDeleteView(LoginRequiredMixin, DeleteCommentMixin, DeleteView):
    model = Comment
    success_url = reverse_lazy('app_account:dashboard')

def MessageView(request):
    if request.user.profile.is_admin:
        ctx = {}
        ctx['Message'] = Contact.objects.all().order_by("-id")
        return render(request, 'registration/list/contact.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')

class ContactDeleteView(LoginRequiredMixin, DeleteContactMixin, DeleteView):
    model = Contact
    success_url = reverse_lazy('app_account:dashboard')

def pcategory(request):
    ctx = {}
    if request.user.profile.is_admin:
        ctx['Category'] = PCategory.objects.all().order_by('-id')
        return render(request, 'registration/list/pcategory.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')

class PCategoryCreateView(LoginRequiredMixin, PCategoryFieldsMixin, CreateView):
    model = PCategory
    template_name = 'registration/add/addpcategory.html'
    success_url = reverse_lazy('app_account:dashboard')

class PCategoryUpdateView(LoginRequiredMixin, PCategoryFieldsMixin, UpdatePCategoryMixin, UpdateView):
    model = PCategory
    template_name = 'registration/add/addpcategory.html'
    success_url = reverse_lazy('app_account:dashboard')

class PCategoryDeleteView(LoginRequiredMixin, DeletePCategoryMixin, DeleteView):
    model = PCategory
    success_url = reverse_lazy('app_account:dashboard')

def projects(request):
    ctx = {}
    if request.user.profile.is_admin:
        ctx['Project'] = Project.objects.all().order_by('-id')
        return render(request, 'registration/list/projects.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید') 

class ProjectCreateView(LoginRequiredMixin, ProjectFieldsMixin, CreateView):
    model = Project
    template_name = 'registration/add/addproject.html'
    success_url = reverse_lazy('app_account:dashboard')

class ProjectUpdateView(LoginRequiredMixin, ProjectFieldsMixin, UpdateProjectMixin, UpdateView):
    model = Project
    template_name = 'registration/add/addproject.html'
    success_url = reverse_lazy('app_account:dashboard')

class ProjectDeleteView(LoginRequiredMixin, DeleteProjectMixin, DeleteView):
    model = Project
    success_url = reverse_lazy('app_account:dashboard')