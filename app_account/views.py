from django.shortcuts import render, redirect, get_object_or_404 
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.http import HttpResponse
from django.contrib import messages
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.edit import FormView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from django.contrib.auth import get_user_model
from django.contrib.auth.tokens import default_token_generator
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode

from app_blog.models import Post, Category, Slider, Comment, Contact
from app_event.models import Event
from app_account.models import Profile
from app_project.models import Project, PCategory
from app_account.mixins import PostFieldsMixin, PostValidMixin, CategoryFieldsMixin, EventFieldsMixin, UpdatePostMixin, DeletePostMixin, ProfileEditMixin, UpdateCategoryMixin, UpdateEventMixin, DeleteCategoryMixin, DeleteEventMixin, SliderFieldsMixin, UpdateSliderMixin, DeleteSliderMixin, CommentFieldsMixin, UpdateCommentMixin, DeleteCommentMixin, DeleteContactMixin, PCategoryFieldsMixin, UpdatePCategoryMixin, DeletePCategoryMixin, ProjectFieldsMixin, UpdateProjectMixin, DeleteProjectMixin, ContactFieldsMixin, UpdateContactMixin
from app_account.forms import UserForm, ProfileForm, LoginForm, RegisterForm
# Create your views here.

UserModel = get_user_model()

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
                current_site = get_current_site(request)
                mail_subject = 'فعالسازی حساب | جامعه گیک‌های کامپیوتر'
                message = render_to_string('app_account/acc_active_email.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                    'token': default_token_generator.make_token(user),
                })
                to_email = form.cleaned_data.get('email')
                email = EmailMessage(
                    mail_subject, message, to=[to_email]
                )
                email.send()
                messages.success(request, 'ثبت نام با موفقیت انجام شد. لطفا حساب خود را از طریق ایمیلی که برایتان ارسال شده تایید کنید.', 'success')
                return redirect('app-account:login')
    else:
        form = RegisterForm()
    return render(request, 'registration/register.html', {'form': form})

def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = UserModel._default_manager.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(request, 'با سپاس از شما؛ حساب کاربری شما اکنون فعال است و می‌توانید به حساب کاربری خود وارد شوید.', 'success')
        return redirect('app-account:login')
    else:
        return HttpResponse('لینک معتبر نیست')



def logoutview(request):
    logout(request)
    messages.success(request, 'شما با موفقیت خارج شدید', 'success')
    return redirect('app-blog:home')

def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(request, 'رمزعبور شما با موفقیت تغییر کرد')
            return redirect('app-blog:home')
        else:
            messages.error(request, 'لطفا اخطارهای زیر را برطرف کنید')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'change_password.html', {
        'form': form
    })

def profile(request, username):
    ctx = {}
    user = User.objects.get(username=username)
    ctx['Event'] = Event.objects.filter(person=user).order_by('-date')
    ctx['Project'] = Project.objects.filter(head=user).order_by('-id')
    post_list = Post.objects.filter(user=user).order_by('-id')
    page = request.GET.get('page', 1)
    paginator = Paginator(post_list, 5)
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
def posts(request):
    ctx = {}
    drafts = Post.objects.filter(status='draft')
    for post in drafts:
        if post.publish_time:
            if post.publish_time < timezone.now():
                post.status = 'published'
                post.save()
    if request.user.profile.is_admin:
        post_list = Post.objects.all().order_by('-id')
    else:
        post_list = Post.objects.filter(user = request.user).order_by('-id')
    page = request.GET.get('page', 1)
    paginator = Paginator(post_list, 10)
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)
    ctx['Post'] = posts
    return render(request, 'registration/list/posts.html', ctx)

@login_required(redirect_field_name='login')
def draftposts(request):
    drafts = Post.objects.filter(status='draft')
    for post in drafts:
        if post.publish_time:
            if post.publish_time < timezone.now():
                post.status = 'published'
                post.save()
    ctx = {}
    if request.user.profile.is_admin:
        ctx['Post'] = Post.objects.filter(status = 'draft').order_by('-id')
        return render(request, 'registration/list/draftposts.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')

@login_required(redirect_field_name='login')
def myposts(request):
    drafts = Post.objects.filter(status='draft')
    for post in drafts:
        if post.publish_time:
            if post.publish_time < timezone.now():
                post.status = 'published'
                post.save()
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
    success_url = reverse_lazy('app_account:posts')

class CategoryCreateView(LoginRequiredMixin, CategoryFieldsMixin, CreateView):
    model = Category
    template_name = 'registration/add/addcategory.html'
    success_url = reverse_lazy('app_account:dashboard-categoty')

class EventCreateView(LoginRequiredMixin, EventFieldsMixin, CreateView):
    model = Event
    template_name = 'registration/add/addevent.html'
    success_url = reverse_lazy('app_account:dashboard-event')

class PostUpdateView(LoginRequiredMixin, PostFieldsMixin, PostValidMixin, UpdatePostMixin, UpdateView):
    model = Post
    template_name = 'registration/add/addpost.html'
    success_url = reverse_lazy('app_account:posts')

class CategoryUpdateView(LoginRequiredMixin, CategoryFieldsMixin, UpdateCategoryMixin, UpdateView):
    model = Category
    template_name = 'registration/add/addcategory.html'
    success_url = reverse_lazy('app_account:dashboard-categoty')

class EventUpdateView(LoginRequiredMixin, EventFieldsMixin, UpdateEventMixin, UpdateView):
    model = Event
    template_name = 'registration/add/addevent.html'
    success_url = reverse_lazy('app_account:dashboard-event')

class PostDeleteView(LoginRequiredMixin, DeletePostMixin, DeleteView):
    model = Post
    success_url = reverse_lazy('app_account:posts')

class CategoryDeleteView(LoginRequiredMixin, DeleteCategoryMixin, DeleteView):
    model = Category
    success_url = reverse_lazy('app_account:dashboard-categoty')

class EventDeleteView(LoginRequiredMixin, DeleteEventMixin, DeleteView):
    model = Event
    success_url = reverse_lazy('app_account:dashboard-event')

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
    success_url = reverse_lazy('app_account:dashboard-slider')

class SliderUpdateView(LoginRequiredMixin, SliderFieldsMixin, UpdateSliderMixin, UpdateView):
    model = Slider
    template_name = 'registration/add/addslide.html'
    success_url = reverse_lazy('app_account:dashboard-slider')

class SlideDeleteView(LoginRequiredMixin, DeleteSliderMixin, DeleteView):
    model = Slider
    success_url = reverse_lazy('app_account:dashboard-slider')

class CommentUpdateView(LoginRequiredMixin, CommentFieldsMixin, UpdateCommentMixin, UpdateView):
    model = Comment
    template_name = 'registration/add/editcomment.html'
    success_url = reverse_lazy('app_account:comments')

class CommentDeleteView(LoginRequiredMixin, DeleteCommentMixin, DeleteView):
    model = Comment
    success_url = reverse_lazy('app_account:comments')

def MessageView(request):
    if request.user.profile.is_admin:
        ctx = {}
        ctx['Message'] = Contact.objects.all().order_by("-id")
        return render(request, 'registration/list/contact.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')

def DSMessageView(request):
    if request.user.profile.is_admin:
        ctx = {}
        ctx['Message'] = Contact.objects.all().filter(status='d').order_by("-id")
        return render(request, 'registration/list/dscontact.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')
        

class ContactDeleteView(LoginRequiredMixin, DeleteContactMixin, DeleteView):
    model = Contact
    success_url = reverse_lazy('app_admin:dashboard')

class ContactUpdateView(LoginRequiredMixin, ContactFieldsMixin, UpdateContactMixin, UpdateView):
    model = Contact
    template_name = 'registration/add/editcontact.html'
    success_url = reverse_lazy('app_account:messages')

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
    success_url = reverse_lazy('app_account:dashboard-pcategoty')

class PCategoryUpdateView(LoginRequiredMixin, PCategoryFieldsMixin, UpdatePCategoryMixin, UpdateView):
    model = PCategory
    template_name = 'registration/add/addpcategory.html'
    success_url = reverse_lazy('app_account:dashboard-pcategoty')

class PCategoryDeleteView(LoginRequiredMixin, DeletePCategoryMixin, DeleteView):
    model = PCategory
    success_url = reverse_lazy('app_account:dashboard-pcategoty')

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
    success_url = reverse_lazy('app_account:dashboard-project')

class ProjectUpdateView(LoginRequiredMixin, ProjectFieldsMixin, UpdateProjectMixin, UpdateView):
    model = Project
    template_name = 'registration/add/addproject.html'
    success_url = reverse_lazy('app_account:dashboard-project')

class ProjectDeleteView(LoginRequiredMixin, DeleteProjectMixin, DeleteView):
    model = Project
    success_url = reverse_lazy('app_account:dashboard-project')