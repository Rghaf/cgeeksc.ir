# Generated by Django 3.0.6 on 2020-08-20 12:56

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('app_blog', '0043_auto_20200820_1722'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='publish_time',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2020, 8, 20, 12, 56, 21, 591386, tzinfo=utc), null=True),
        ),
    ]