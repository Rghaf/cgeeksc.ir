# Generated by Django 3.0.6 on 2020-08-30 17:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_event', '0002_event_person'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='event_type',
            field=models.CharField(choices=[('a', 'مجازی'), ('b', 'حضوری')], max_length=1, null=True, verbose_name='وضعیت برگزاری'),
        ),
    ]
