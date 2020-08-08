# Generated by Django 3.0.6 on 2020-08-06 18:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_blog', '0038_contact_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='slider',
            name='title',
            field=models.CharField(max_length=250, null=True, verbose_name='عنوان'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='status',
            field=models.CharField(choices=[('s', 'دیده شده'), ('d', 'دیده نشده')], default='d', max_length=1, null=True, verbose_name='وضعیت'),
        ),
    ]
