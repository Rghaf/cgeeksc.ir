from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class Profile(models.Model):
        user = models.OneToOneField(User, on_delete=models.CASCADE)
        image = models.ImageField(null = True, blank = True, upload_to = 'images/profiles')
        bio = models.TextField(null = True, blank = True, max_length = 250)
        github = models.CharField(null = True, blank = True, max_length = 750)
        trello = models.CharField(null = True, blank = True, max_length = 750)
        instagram = models.CharField(null = True, blank = True, max_length = 750)
        email = models.CharField(null = True, blank = True, max_length = 750)
        linkedin = models.CharField(null = True, blank = True, max_length = 750)
        twitter = models.CharField(null = True, blank = True, max_length = 750)
        is_admin = models.BooleanField(null = True, default = False)
        is_author = models.BooleanField(null = True, default = False)

        def img_404(self):
            return settings.AVATAR_404
        
        def get_absolute_url(self):
            return reverse('app-account:profile', kwargs={'username': self.user.username}) 