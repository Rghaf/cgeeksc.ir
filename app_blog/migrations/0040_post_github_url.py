# Generated by Django 3.0.6 on 2020-08-13 08:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_blog', '0039_auto_20200806_2328'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='github_url',
            field=models.CharField(blank=True, max_length=750, null=True, verbose_name='لینک گیت\u200cهاب'),
        ),
    ]
