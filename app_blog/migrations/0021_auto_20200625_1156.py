# Generated by Django 3.0.6 on 2020-06-25 07:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app_blog', '0020_auto_20200625_0022'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='mother',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='childrens', to='app_blog.Category'),
        ),
    ]
