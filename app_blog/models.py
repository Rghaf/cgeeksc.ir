from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import User
from django.urls import reverse
from django.conf import settings
from django.utils import timezone
from django.contrib.sitemaps import ping_google
import jdatetime

class Slider(models.Model):
    title = models.CharField(max_length=250, null = True, verbose_name="عنوان")
    image = models.ImageField(upload_to = 'images/slider', null = True, verbose_name="تصویر")
    link = models.CharField(max_length = 1200, null = True, blank = True, verbose_name="پیوند", help_text="پیوند باید کامل و همراه با http باشد.")

    def __str__(self):
        return "%s" % (self.title)

class Contact(models.Model):
    STATUS_CHOICES =(
        ('s', 'دیده شده'),
        ('d', 'دیده نشده')
    )
    SUBJECT_CHOISES = (
        ('a', 'تبلیغات'),
        ('b', 'همکاری تجاری'),
        ('c', 'برگزاری رویداد'),
        ('d', 'درخواست همکاری'),
        ('e', 'سایر'),
    )
    title = models.CharField(max_length = 250, null = True, verbose_name='عنوان')
    name = models.CharField(max_length = 100, null = True, verbose_name='نام شما')
    mail = models.EmailField(max_length = 200, null = True, verbose_name='ایمیل')
    phone = models.CharField(max_length = 12, null = True, blank = True, verbose_name='شماره تماس')
    subject = models.CharField(max_length = 1, null = True, choices = SUBJECT_CHOISES, verbose_name='موضوع') 
    message = models.TextField(max_length = 1500, null = True, verbose_name='پیام شما')
    status = models.CharField(max_length = 1, null = True, choices = STATUS_CHOICES, default='d', verbose_name='وضعیت')  

class Category(models.Model):
    mother = models.ForeignKey("self", null = True, default = None, blank = True, on_delete = models.SET_NULL, related_name='childrens', verbose_name='دسته‌بندی مادر')
    title = models.CharField(max_length=150, null=True, unique=True, verbose_name='عنوان')
    slug = models.SlugField(max_length=200, null=True, unique=True, verbose_name='پیوند')
    description = RichTextField(max_length=1250, null=True, blank=True, verbose_name='توضیحات')

    def __str__(self):
        return "%s" % (self.title)

    def get_absolute_url(self):
        return reverse('app-blog:category', kwargs={'slug': self.slug})        

class Post(models.Model):
    STATUS_CHOICES = (
        ('draft', 'پیش نویس'),
        ('published', 'منتشر شده'),
    )

    title = models.CharField(max_length=250, null=True, verbose_name='عنوان')
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, verbose_name='نویسنده')
    slug = models.SlugField(max_length=200, null=True, unique=True, verbose_name='پیوند')
    content = RichTextUploadingField(null = True, verbose_name='متن اصلی')
    summary = models.TextField(max_length = 300, null =True, verbose_name='خلاصه')
    image = models.ImageField(upload_to = 'images/posts', null=True, verbose_name='تصویر شاخص')
    image_alt = models.CharField(max_length=250, null=True, blank=True, verbose_name='متن جایگزین')
    publish_date = models.DateField(auto_now_add=True)
    status = models.CharField(null=True, max_length=9, choices=STATUS_CHOICES, verbose_name='وضعیت انتشار')
    category = models.ForeignKey(Category ,on_delete=models.CASCADE, null=True, verbose_name='دسته بندی')
    github_url = models.CharField(max_length=750, null=True, blank=True, verbose_name='لینک گیت‌هاب')
    file_url = models.CharField(max_length=750, null=True, blank=True, verbose_name='لینک دانلود فایل‌')
    youtube_url = models.CharField(max_length=750, null=True, blank=True, verbose_name='لینک ویدیو یوتوب')
    refrence = models.TextField(max_length=1500, null=True, blank=True, verbose_name='منابع')
    publish_time = models.DateTimeField(null=True, blank=True, verbose_name='زمانبندی انتشار', help_text='در صورتی که مایل هستید پست به صورت خودکار منتشر شود تاریخ و ساعت مورد نظر را انتخاب کنید. در غیر این صورت این فیلد را خالی بگذارید.')
    
    def save(self, force_insert=False, force_update=False):
        super().save(force_insert, force_update)
        ping_google(sitemap_url='/sitemap.xml')

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
    post = models.ForeignKey(Post, on_delete = models.CASCADE, null = True, verbose_name='پست')
    content = models.TextField(max_length = 1500, null = True, verbose_name='دیدگاه')
    mother = models.ForeignKey('self', on_delete = models.CASCADE, null = True, blank = True, related_name='childrens')
    date = models.DateField(auto_now_add=True, null = True)
    status = models.CharField(max_length = 1, default = 'd', choices=STATUS_CHOICES, verbose_name='وضعیت تایید')

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







