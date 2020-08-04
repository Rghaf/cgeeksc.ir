from django.db import models
from django.urls import reverse
from django.conf import settings
from ckeditor_uploader.fields import RichTextUploadingField
import jdatetime


class Event(models.Model):
    STATUS_CHOICES = (
        ('a', 'به اتمام رسیده'),
        ('b', 'آغاز شده'),
        ('c', 'برگزار نشده')
    )
    title = models.CharField(max_length=250, null=True, verbose_name = "عنوان")
    slug = models.SlugField(max_length=200, null=True, unique=True, verbose_name = "آدرس")
    description = RichTextUploadingField(null = True, verbose_name='توضیحات')
    summary = models.TextField(null = True, max_length = 250, verbose_name='خلاصه')
    image = models.ImageField(upload_to = 'images/events', null=True, verbose_name='تصویر شاخص')
    date = models.DateField(null = True, verbose_name='تاریخ')
    person = models.CharField(max_length = 70 ,null = True, verbose_name='ارائه دهنده')
    file_url = models.CharField(max_length = 750, null = True, blank = True, verbose_name='لینک دانلود فایل')
    youtube_url = models.CharField(max_length = 500, null = True, blank = True, verbose_name='لینک ویدیو یوتوب')
    status = models.CharField(max_length=1, null = True, choices = STATUS_CHOICES, verbose_name='وضعیت برگزاری')

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