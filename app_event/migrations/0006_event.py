# Generated by Django 3.0.6 on 2020-05-23 21:50

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('app_event', '0005_delete_event'),
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=250, null=True)),
                ('slug', models.SlugField(max_length=200, null=True)),
                ('description', models.TextField(max_length=9500)),
                ('summary', models.TextField(max_length=100, null=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='images')),
                ('date', models.DateField(null=True)),
                ('person', models.CharField(max_length=70, null=True)),
                ('file_url', models.CharField(max_length=500, null=True)),
                ('status', models.CharField(choices=[('a', 'به اتمام رسیده'), ('b', 'آغاز شده'), ('c', 'برگزار نشده')], max_length=1, null=True)),
            ],
        ),
    ]
