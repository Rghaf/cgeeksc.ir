# Generated by Django 3.0.6 on 2020-08-20 12:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_blog', '0042_auto_20200820_1540'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='test',
        ),
        migrations.AlterField(
            model_name='post',
            name='status',
            field=models.CharField(choices=[('draft', 'پیش نویس'), ('published', 'منتشر شده')], max_length=9, null=True, verbose_name='وضعیت انتشار'),
        ),
    ]
