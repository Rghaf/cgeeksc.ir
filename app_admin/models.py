from django.db import models

# Create your models here.
class callout(models.Model):
    title = models.CharField(max_length=250, null=True)
    message = models.TextField(max_length=750, null=True)
    date = models.DateTimeField(auto_now=True, null=True)

class files(models.Model):
    site = models.FileField(upload_to='uploads/admin', null=True)
    instagram = models.FileField(upload_to='uploads/admin', null=True)
    calender = models.FileField(upload_to='uploads/admin', null=True)

class calender(models.Model):
    image = models.ImageField(upload_to='uploads/admin', null=True)

    
