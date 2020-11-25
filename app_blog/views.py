from django.shortcuts import render, redirect 
from django.contrib import messages
from django.db.models import Q
from app_blog.models import Post, Category, Slider, Comment, Contact
from app_event.models import Event
from app_project.models import Project
from app_blog.forms import AddComment, ContactForm
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator
from django.core.mail import send_mail
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.utils import timezone
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.template.loader import render_to_string
from weasyprint import HTML

def home(request):
    ctx = {}
    ctx['Post'] = Post.objects.filter(status='published').order_by('-publish_date')[0:3]
    ctx['Event'] = Event.objects.all().order_by("-date")[0:3]
    ctx['Slider'] = Slider.objects.all().order_by("-id")[0:5]
    drafts = Post.objects.filter(status='draft')
    for post in drafts:
        if post.publish_time:
            if post.publish_time < timezone.now():
                post.status = 'published'
                post.save()
    return render(request, 'home.html', ctx)

def bar(request):
    ctx = {}
    ctx['Navcat'] = Category.objects.all()
    return render(request, 'base.html', ctx)

def search(request):
    ctx = {}
    if request.method == 'POST':
        word = request.POST.get('q')
        if word:
            ctx['word'] = word
            ctx['Post'] = Post.objects.filter(status='published').filter(Q(title__icontains = word) | Q(content__icontains = word) | Q(summary__icontains = word))
            ctx['Event'] = Event.objects.filter(Q(title__icontains = word) | Q(description__icontains = word) | Q(summary__icontains = word))
            ctx['Project'] = Project.objects.filter(Q(title__icontains = word) | Q(description__icontains = word))
    return render(request, 'search.html', ctx)

def about(request):
    return render(request, 'aboutus.html')

def contact(request):
    ctx = {}
    form = ContactForm()
    ctx['form'] = form
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            new_commit = form.save()
            messages.success(request, 'پیام شما با موفقیت ثبت شد. تیم مدیریت در صورت نیاز با شما در ارتباط خواهند بود. با تشکر از همراهی شما', 'success')
    return render(request, 'contactus.html', ctx)
    
def post(request, slug):
    ctx = {}
    post = get_object_or_404(Post, slug=slug)
    ctx['Comment'] = Comment.objects.all().filter(post=post, status = 'a')
    ctx['Post'] = post
    ctx['Sug'] = Post.objects.filter(status='published').order_by('-id').exclude(slug=slug)[0:3]
    form = AddComment()
    ctx['form'] = form
    if request.method == 'POST':
        form = AddComment(request.POST)
        if form.is_valid():
            new_commit = form.save(commit = False)
            new_commit.post = post
            new_commit.user = request.user
            new_commit.save()
            return HttpResponseRedirect(reverse('app-blog:post', args=(slug,)))
            messages.success(request, 'نظر شما با موفقیت ثبت شد و بعد از تایید مدیریت منتشر خواهد شد. سپاس از همراهی شما')
    drafts = Post.objects.filter(status='draft')
    for post in drafts:
        if post.publish_time:
            if post.publish_time < timezone.now():
                post.status = 'published'
                post.save()
    return render(request, 'post.html', ctx)

def postpdf(request, slug):
    post = get_object_or_404(Post, slug=slug)
    html_string = render_to_string('pdf/pdf_template.html', {'Post': post})
    html = HTML(string=html_string)
    html.write_pdf(target='/tmp/mypdf.pdf');
    fs = FileSystemStorage('/tmp')
    with fs.open('mypdf.pdf') as pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        response['Content-Disposition'] = 'attachment; filename="mypdf.pdf"'
        return response
    return response

def commentreply(request, post_id, comment_id):
    post = get_object_or_404(Post, pk=post_id)
    mail = post.user.email
    comment = get_object_or_404(Comment, pk=comment_id)
    if request.method == 'POST':
        form = AddComment(request.POST)
        if form.is_valid():
            new_commit = form.save(commit = False)
            new_commit.post = post
            new_commit.user = request.user
            new_commit.mother = comment
            new_commit.save()
            messages.success(request, 'پاسخ شما با موفقیت ثبت شد و پس از تایید مدیریت منتشر خواهد شد')
            send_mail('پاسخ جدیدی برای دیدگاه شما ثبت شده است',
                'با سلام خدمت شما کاربر گرامی؛ پاسخی جدید برای دیدگاه شما در وبسایت cgeeksc.ir ثبت شده است. شما می‌توانید با مراجعه وبسایت این پاسخ جدید را بررسی کنید.',
                'cgeeksc.info@gmail.com', [mail,])
    return redirect('app-blog:post', post.slug)


def category(request, slug):
    category = get_object_or_404(Category, slug=slug)
    mother = category.mother
    post_list = Post.objects.all().filter(category__slug=slug, status='published')
    for child in category.childrens.all():
        post_list = post_list.union(Post.objects.all().filter(category__title=child, status='published'))
        for cchild in child.childrens.all():
            post_list = post_list.union(Post.objects.all().filter(category__title=cchild, status='published'))
    page = request.GET.get('page', 1)
    paginator = Paginator(post_list, 7)
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)
    ctx = {}
    ctx['Category'] = category
    ctx['Post'] = posts
    return render(request, 'category.html', ctx)

