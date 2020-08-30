from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.utils import timezone

from app_admin.models import callout, calender, files
from app_blog.models import Post, Comment, Contact
from app_event.models import Event
# Create your views here.

@login_required(redirect_field_name='login')
def dashboard(request):
    ctx = {}
    drafts = Post.objects.filter(status='draft')
    for post in drafts:
        if post.publish_time:
            if post.publish_time < timezone.now():
                post.status = 'published'
                post.save()
    if request.user.profile.is_admin or request.user.profile.is_author:
        ctx['Callout'] = callout.objects.all().order_by('-id')[:3]
        ctx['File'] = files.objects.all()
        ctx['Calender'] = calender.objects.last()
        ctx['Comment'] = Comment.objects.all().count
        ctx['Domment'] = Comment.objects.filter(status='d').count
        ctx['Contact'] = Contact.objects.all().count
        ctx['Dontact'] = Contact.objects.filter(status='d').count
        ctx['Post'] = Post.objects.all().count
        ctx['Dost'] = Post.objects.filter(status = 'draft').count
        ctx['Event'] = Event.objects.all().count
        ctx['Devent'] = Event.objects.filter(status = 'c').count
        
        return render(request, 'registration/admin-dashboard.html', ctx)
    else:
        return HttpResponse('شما به این صفحه دسترسی ندارید')

def postsearch(request):
    ctx = {}
    if request.method == 'POST':
        word = request.POST.get('q')
        if word:
            ctx['word'] = word
            ctx['Post'] = Post.objects.filter(Q(title__icontains = word) | Q(content__icontains = word) | Q(summary__icontains = word))
    return render(request, 'registration/list/posts-search.html', ctx)