# Generated by Django 3.0.6 on 2020-06-16 18:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_blog', '0012_auto_20200615_1914'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='category',
        ),
        migrations.AddField(
            model_name='post',
            name='category',
            field=models.ManyToManyField(null=True, to='app_blog.Category'),
        ),
    ]
