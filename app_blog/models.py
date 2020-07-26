from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import User
from django.urls import reverse
from django.conf import settings
import jdatetime

class Slider(models.Model):
    image = models.ImageField(upload_to = 'images/slider', null = True)
    title = models.CharField(max_length = 120, null = True, blank = True)
    description = models.TextField(max_length = 250, null = True, blank = True)
    link = models.CharField(max_length = 1200, null = True, blank = True)

    def __str__(self):
        return "%s" % (self.title)

class Contact(models.Model):
    SUBJECT_CHOISES = (
        ('a', 'تبلیغات'),
        ('b', 'همکاری تجاری'),
        ('c', 'برگزاری رویداد'),
        ('d', 'درخواست همکاری'),
        ('e', 'سایر'),
    )
    title = models.CharField(max_length = 250, null = True)
    name = models.CharField(max_length = 100, null = True)
    mail = models.EmailField(max_length = 200, null = True)
    phone = models.CharField(max_length = 12, null = True, blank = True)
    subject = models.CharField(max_length = 1, null = True, choices = SUBJECT_CHOISES) 
    message = models.TextField(max_length = 1500, null = True)

class Category(models.Model):
    mother = models.ForeignKey("self", null = True, default = None, blank = True, on_delete = models.SET_NULL, related_name='childrens')
    title = models.CharField(max_length=150, null=True)
    slug = models.SlugField(max_length=200, null=True)
    description = RichTextField(max_length=1250, null=True, blank=True)

    def __str__(self):
        return "%s" % (self.title)

    def get_absolute_url(self):
        return reverse('app-blog:category', kwargs={'slug': self.slug})        

class Post(models.Model):
    STATUS_CHOICES = (
        ('draft', 'پیش نویس'),
        ('published', 'منتشر شده'),
    )

    title = models.CharField(max_length=250, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    slug = models.SlugField(max_length=200, null=True)
    content = RichTextUploadingField(null = True)
    summary = models.TextField(max_length = 300, null =  True)
    image = models.ImageField(upload_to = 'images/posts', null=True, blank=True)
    publish_date = models.DateField(auto_now_add=True)
    status = models.CharField(null=True, max_length=9, choices=STATUS_CHOICES)
    category = models.ForeignKey(Category ,on_delete=models.CASCADE, null=True)
    file_url = models.CharField(max_length=750, null=True, blank=True)
    youtube_url = models.CharField(max_length=750, null=True, blank=True)
    refrence = models.TextField(max_length=1500, null=True, blank=True) 
    
    def __str__(self):
        return "%s - %s" % (self.title, self.status)

    def img_404(self):
        return settings.POST_404
    
    def img_th404(self):
        return settings.POST_TH404

    def jdate(self):
        jdatetime.set_locale('fa_IR')
        jdatetime.datetime.now().strftime('%A %B')
        jd_datetime = jdatetime.datetime.fromgregorian(
            year = self.publish_date.year,
            month = self.publish_date.month,
            day = self.publish_date.day,
        )
        return jd_datetime.strftime('%A, %d %B %Y')

    def get_absolute_url(self):
        return reverse('app-blog:post', kwargs={'slug': self.slug})    

class Comment(models.Model):
    STATUS_CHOICES = (
        ('d', 'در انتظار تایید'),
        ('a', 'تایید شده'),
    )
    user = models.ForeignKey(User, on_delete = models.CASCADE, null = True)
    post = models.ForeignKey(Post, on_delete = models.CASCADE, null = True)
    content = models.TextField(max_length = 1500, null = True)
    mother = models.ForeignKey('self', on_delete = models.CASCADE, null = True, blank = True, related_name='childrens')
    date = models.DateField(auto_now_add=True, null = True)
    status = models.CharField(max_length = 1, default = 'd', choices=STATUS_CHOICES)

    def jdate(self):
        jdatetime.set_locale('fa_IR')
        jdatetime.datetime.now().strftime('%A %B')
        jd_datetime = jdatetime.datetime.fromgregorian(
            year = self.date.year,
            month = self.date.month,
            day = self.date.day,
        )
        return jd_datetime.strftime('%A, %d %B %Y')

    def __str__(self):
        return "%s - %s - %s" % (self.post, self.user,  self.date)







