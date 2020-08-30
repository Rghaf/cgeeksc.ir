from django.db import models
from django.urls import reverse
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import User

# Create your models here.
class PCategory(models.Model):
    title = models.CharField(max_length= 120, null = True, verbose_name='عنوان')
    slug = models.SlugField(max_length = 175, null = True, unique=True, verbose_name='پیوند')

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('app-project:projectcategory', kwargs={'slug': self.slug})

class Project(models.Model):
    title = models.CharField(max_length = 50, null = True, verbose_name='عنوان')
    image = models.ImageField(null = True, verbose_name='تصویر شاخص')
    slug = models.SlugField(max_length = 250, null = True, unique=True, verbose_name='پیوند')
    description = RichTextUploadingField(null = True, verbose_name='توضیحات')
    summary = models.TextField(max_length = 300, null =True, verbose_name='خلاصه')
    head = models.ForeignKey(User, null = True, on_delete = models.CASCADE, verbose_name='سرپرست پروژه')
    members = models.ManyToManyField(User, blank =  True, related_name='members', verbose_name='اعضای تیم', help_text='با نگهداشتن کلید Ctrl می‌توانید چند عضو انتخاب کنید')
    category = models.ForeignKey(PCategory, null = True, on_delete = models.CASCADE, related_name='children', verbose_name='دسته بندی')
    file_url = models.CharField(max_length = 2250, null = True, blank = True, verbose_name='لینک دانلود فایل')
    youtube_url = models.CharField(max_length = 2250, null = True, blank = True, verbose_name='لینک ویدیو یوتوب')
    github_url = models.CharField(max_length = 2250, null = True, blank = True, verbose_name='لینک پروژه در گیت‌هاب')
    
    def get_absolute_url(self):
        return reverse('app-project:project', kwargs={'slug': self.slug})
