# Generated by Django 3.0.6 on 2020-06-16 19:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_blog', '0014_auto_20200616_2330'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='category',
        ),
        migrations.AddField(
            model_name='post',
            name='category',
            field=models.ManyToManyField(to='app_blog.Category'),
        ),
    ]
