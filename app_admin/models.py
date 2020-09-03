from django.db import models
import jdatetime

# Create your models here.
class callout(models.Model):
    title = models.CharField(max_length=250, null=True)
    message = models.TextField(max_length=750, null=True)
    date = models.DateTimeField(auto_now=True, null=True)

    def jdate(self):
        jdatetime.set_locale('fa_IR')
        jdatetime.datetime.now().strftime('%A %B')
        jd_datetime = jdatetime.datetime.fromgregorian(
            year = self.date.year,
            month = self.date.month,
            day = self.date.day,
        )
        return jd_datetime.strftime('%A, %d %B %Y')

class files(models.Model):
    title = models.CharField(max_length=120, null=True)
    admin_file = models.FileField(upload_to='uploads/admin', null=True)

class calender(models.Model):
    image = models.ImageField(upload_to='uploads/admin', null=True)

    
