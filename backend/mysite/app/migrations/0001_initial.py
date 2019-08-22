# Generated by Django 2.2.4 on 2019-08-21 17:27

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='record',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=64)),
                ('processed_Date_Time', models.DateTimeField(default=django.utils.timezone.now)),
                ('name', models.CharField(max_length=64)),
                ('number', models.CharField(max_length=64)),
            ],
        ),
        migrations.CreateModel(
            name='user_Record',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=64)),
                ('registered_Date_Time', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
    ]
