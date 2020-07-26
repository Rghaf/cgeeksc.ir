# Generated by Django 3.0.6 on 2020-06-15 07:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_event', '0008_auto_20200524_1400'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='youtube_url',
            field=models.CharField(blank=True, max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='event',
            name='file_url',
            field=models.CharField(blank=True, max_length=750, null=True),
        ),
    ]
