# Generated by Django 3.0.6 on 2020-08-01 13:28

import ckeditor_uploader.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('app_project', '0004_project_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pcategory',
            name='slug',
            field=models.SlugField(max_length=175, null=True, unique=True, verbose_name='پیوند'),
        ),
        migrations.AlterField(
            model_name='pcategory',
            name='title',
            field=models.CharField(max_length=120, null=True, verbose_name='عنوان'),
        ),
        migrations.AlterField(
            model_name='project',
            name='category',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='app_project.PCategory', verbose_name='دسته بندی'),
        ),
        migrations.AlterField(
            model_name='project',
            name='description',
            field=ckeditor_uploader.fields.RichTextUploadingField(null=True, verbose_name='توضیحات'),
        ),
        migrations.AlterField(
            model_name='project',
            name='file_url',
            field=models.CharField(blank=True, max_length=2250, null=True, verbose_name='لینک دانلود فایل'),
        ),
        migrations.AlterField(
            model_name='project',
            name='github_url',
            field=models.CharField(blank=True, max_length=2250, null=True, verbose_name='لینک پروژه در گیت\u200cهاب'),
        ),
        migrations.AlterField(
            model_name='project',
            name='head',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='سرپرست پروژه'),
        ),
        migrations.AlterField(
            model_name='project',
            name='image',
            field=models.ImageField(null=True, upload_to='', verbose_name='تصویر شاخص'),
        ),
        migrations.AlterField(
            model_name='project',
            name='members',
            field=models.ManyToManyField(blank=True, help_text='با نگهداشتن کلید Ctrl می\u200cتوانید چند عضو انتخاب کنید', related_name='members', to=settings.AUTH_USER_MODEL, verbose_name='اعضای تیم'),
        ),
        migrations.AlterField(
            model_name='project',
            name='slug',
            field=models.SlugField(max_length=250, null=True, unique=True, verbose_name='پیوند'),
        ),
        migrations.AlterField(
            model_name='project',
            name='title',
            field=models.CharField(max_length=50, null=True, verbose_name='عنوان'),
        ),
        migrations.AlterField(
            model_name='project',
            name='youtube_url',
            field=models.CharField(blank=True, max_length=2250, null=True, verbose_name='لینک ویدیو یوتوب'),
        ),
    ]
