# Generated by Django 3.0.6 on 2020-08-19 18:52

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='calender',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(null=True, upload_to='uploads/amin')),
            ],
        ),
        migrations.CreateModel(
            name='callout',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=250, null=True)),
                ('message', models.TextField(max_length=750, null=True)),
                ('date', models.DateTimeField(auto_now=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='files',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('site', models.FileField(null=True, upload_to='uploads/amin')),
                ('instagram', models.FileField(null=True, upload_to='uploads/amin')),
                ('calender', models.FileField(null=True, upload_to='uploads/amin')),
            ],
        ),
    ]