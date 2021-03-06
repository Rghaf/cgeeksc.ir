# Generated by Django 3.0.6 on 2020-08-12 20:55

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=250, null=True, verbose_name='عنوان')),
                ('slug', models.SlugField(max_length=200, null=True, unique=True, verbose_name='آدرس')),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(null=True, verbose_name='توضیحات')),
                ('summary', models.TextField(max_length=250, null=True, verbose_name='خلاصه')),
                ('image', models.ImageField(null=True, upload_to='images/events', verbose_name='تصویر شاخص')),
                ('date', models.DateField(null=True, verbose_name='تاریخ')),
                ('file_url', models.CharField(blank=True, max_length=750, null=True, verbose_name='لینک دانلود فایل')),
                ('youtube_url', models.CharField(blank=True, max_length=500, null=True, verbose_name='لینک ویدیو یوتوب')),
                ('status', models.CharField(choices=[('a', 'به اتمام رسیده'), ('b', 'آغاز شده'), ('c', 'برگزار نشده')], max_length=1, null=True, verbose_name='وضعیت برگزاری')),
            ],
            options={
                'verbose_name': 'رویداد',
                'verbose_name_plural': 'رویدادها',
            },
        ),
    ]
