from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class Profile(models.Model):
        user = models.OneToOneField(User, on_delete=models.CASCADE)
        image = models.ImageField(null = True, blank = True, upload_to = 'images/profiles', verbose_name='عکس پروفایل')
        bio = models.TextField(null = True, blank = True, max_length = 250, verbose_name='درباره شما')
        github = models.CharField(null = True, blank = True, max_length = 750, verbose_name='آدرس گیت‌هاب شما')
        trello = models.CharField(null = True, blank = True, max_length = 750, verbose_name='آدرس ترلو شما')
        instagram = models.CharField(null = True, blank = True, max_length = 750, verbose_name='آدرس اینستاگرام شما')
        email = models.CharField(null = True, blank = True, max_length = 750, verbose_name='آدرس ایمیل')
        linkedin = models.CharField(null = True, blank = True, max_length = 750, verbose_name='آدرس لینکدین شما')
        twitter = models.CharField(null = True, blank = True, max_length = 750, verbose_name='آدرس توییتر شما')
        is_admin = models.BooleanField(null = True, default = False, verbose_name='وضعیت ادمینی')
        is_author = models.BooleanField(null = True, default = False, verbose_name='وضعیت نویسندگی')

        def img_404(self):
            return settings.AVATAR_404
        
        def get_absolute_url(self):
            return reverse('app-account:profile', kwargs={'username': self.user.username}) 