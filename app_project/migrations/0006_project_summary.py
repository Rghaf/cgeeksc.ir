# Generated by Django 3.0.6 on 2020-08-30 16:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_project', '0005_auto_20200801_1758'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='summary',
            field=models.TextField(max_length=300, null=True, verbose_name='خلاصه'),
        ),
    ]
