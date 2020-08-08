# Generated by Django 3.0.6 on 2020-08-01 13:28

import ckeditor.fields
import ckeditor_uploader.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('app_blog', '0034_remove_slider_title'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='description',
            field=ckeditor.fields.RichTextField(blank=True, max_length=1250, null=True, verbose_name='توضیحات'),
        ),
        migrations.AlterField(
            model_name='category',
            name='mother',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='childrens', to='app_blog.Category', verbose_name='دسته\u200cبندی مادر'),
        ),
        migrations.AlterField(
            model_name='category',
            name='slug',
            field=models.SlugField(max_length=200, null=True, unique=True, verbose_name='پیوند'),
        ),
        migrations.AlterField(
            model_name='category',
            name='title',
            field=models.CharField(max_length=150, null=True, unique=True, verbose_name='عنوان'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='content',
            field=models.TextField(max_length=1500, null=True, verbose_name='دیدگاه'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='post',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='app_blog.Post', verbose_name='پست'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='status',
            field=models.CharField(choices=[('d', 'در انتظار تایید'), ('a', 'تایید شده')], default='d', max_length=1, verbose_name='وضعیت تایید'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='mail',
            field=models.EmailField(max_length=200, null=True, verbose_name='ایمیل'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='message',
            field=models.TextField(max_length=1500, null=True, verbose_name='پیام شما'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='name',
            field=models.CharField(max_length=100, null=True, verbose_name='نام شما'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='phone',
            field=models.CharField(blank=True, max_length=12, null=True, verbose_name='شماره تماس'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='subject',
            field=models.CharField(choices=[('a', 'تبلیغات'), ('b', 'همکاری تجاری'), ('c', 'برگزاری رویداد'), ('d', 'درخواست همکاری'), ('e', 'سایر')], max_length=1, null=True, verbose_name='موضوع'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='title',
            field=models.CharField(max_length=250, null=True, verbose_name='عنوان'),
        ),
        migrations.AlterField(
            model_name='post',
            name='category',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='app_blog.Category', verbose_name='دسته بندی'),
        ),
        migrations.AlterField(
            model_name='post',
            name='content',
            field=ckeditor_uploader.fields.RichTextUploadingField(null=True, verbose_name='متن اصلی'),
        ),
        migrations.AlterField(
            model_name='post',
            name='file_url',
            field=models.CharField(blank=True, max_length=750, null=True, verbose_name='لینک دانلود فایل\u200c'),
        ),
        migrations.AlterField(
            model_name='post',
            name='image',
            field=models.ImageField(null=True, upload_to='images/posts', verbose_name='تصویر شاخص'),
        ),
        migrations.AlterField(
            model_name='post',
            name='refrence',
            field=models.TextField(blank=True, max_length=1500, null=True, verbose_name='منابع'),
        ),
        migrations.AlterField(
            model_name='post',
            name='slug',
            field=models.SlugField(max_length=200, null=True, unique=True, verbose_name='پیوند'),
        ),
        migrations.AlterField(
            model_name='post',
            name='status',
            field=models.CharField(choices=[('draft', 'پیش نویس'), ('published', 'منتشر شده')], max_length=9, null=True, verbose_name='وضعیت انتشار'),
        ),
        migrations.AlterField(
            model_name='post',
            name='summary',
            field=models.TextField(max_length=300, null=True, verbose_name='خلاصه'),
        ),
        migrations.AlterField(
            model_name='post',
            name='title',
            field=models.CharField(max_length=250, null=True, verbose_name='عنوان'),
        ),
        migrations.AlterField(
            model_name='post',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='نویسنده'),
        ),
        migrations.AlterField(
            model_name='post',
            name='youtube_url',
            field=models.CharField(blank=True, max_length=750, null=True, verbose_name='لینک ویدیو یوتوب'),
        ),
    ]