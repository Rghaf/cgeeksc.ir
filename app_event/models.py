from django.db import models
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.sitemaps import ping_google
import jdatetime


class Event(models.Model):
    STATUS_CHOICES = (
        ('a', 'به اتمام رسیده'),
        ('b', 'آغاز شده'),
        ('c', 'برگزار نشده')
    )
    TYPE_CHOICES = (
        ('a', 'مجازی'),
        ('b', 'حضوری'),
    )
    title = models.CharField(max_length=250, null=True, verbose_name = "عنوان")
    slug = models.SlugField(max_length=200, null=True, unique=True, verbose_name = "آدرس")
    description = RichTextUploadingField(null = True, verbose_name='توضیحات')
    summary = models.TextField(null = True, max_length = 250, verbose_name='خلاصه')
    image = models.ImageField(upload_to = 'images/events', null=True, verbose_name='تصویر شاخص')
    date = models.DateField(null = True, verbose_name='تاریخ')
    person = models.ForeignKey(User, null=True, on_delete=models.SET_NULL, verbose_name='ارائه دهنده')
    file_url = models.FileField(upload_to='uploads/admin', null=True, blank=True, verbose_name='فایل', help_text='در صورتی که مایل به اشتراک گذاری فایل استفاده شده در رویداد هستید از این قسمت وارد کنید.')
    youtube_url = models.CharField(max_length = 500, null = True, blank = True, verbose_name='لینک ویدیو یوتوب')
    status = models.CharField(max_length=1, null = True, choices = STATUS_CHOICES, verbose_name='وضعیت برگزاری')
    event_type = models.CharField(max_length=1, null = True, choices = TYPE_CHOICES, verbose_name='نوع رویداد')
    addres = models.TextField(null = True, blank=True, max_length = 500, verbose_name='آدرس', help_text='آدرس محل و یا لینک دسترسی به رویداد را در این قسمت قرار دهید')

    def save(self, force_insert=False, force_update=False):
        super().save(force_insert, force_update)
        ping_google(sitemap_url='/sitemap.xml')

    def img_404(self):
        return settings.POST_404

    def img_th404(self):
        return settings.POST_TH404

    def jdate(self):
        jdatetime.set_locale('fa_IR')
        jdatetime.datetime.now().strftime('%A %B')
        jd_datetime = jdatetime.datetime.fromgregorian(
            year = self.date.year,
            month = self.date.month,
            day = self.date.day,
        )
        return jd_datetime.strftime('%A, %d %B %Y')

    def get_absolute_url(self):
        return reverse('app-event:event', kwargs={'slug': self.slug})
    
    class Meta:
        verbose_name = 'رویداد'
        verbose_name_plural = 'رویدادها'