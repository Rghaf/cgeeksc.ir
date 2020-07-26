from django.db import models
from django.urls import reverse
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import User

# Create your models here.
class PCategory(models.Model):
    title = models.CharField(max_length= 120, null = True)
    slug = models.SlugField(max_length = 175, null = True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('app-project:projectcategory', kwargs={'slug': self.slug})

class Project(models.Model):
    title = models.CharField(max_length = 50,null = True)
    image = models.ImageField(null = True)
    slug = models.SlugField(max_length = 250, null = True)
    description = RichTextUploadingField(null = True)
    head = models.ForeignKey(User, null = True, on_delete = models.CASCADE)
    members = models.ManyToManyField(User, blank =  True, related_name='members')
    category = models.ForeignKey(PCategory, null = True, on_delete = models.CASCADE, related_name='children')
    file_url = models.CharField(max_length = 2250, null = True, blank = True)
    youtube_url = models.CharField(max_length = 2250, null = True, blank = True)
    github_url = models.CharField(max_length = 2250, null = True, blank = True)
    
    def get_absolute_url(self):
        return reverse('app-project:project', kwargs={'slug': self.slug})
