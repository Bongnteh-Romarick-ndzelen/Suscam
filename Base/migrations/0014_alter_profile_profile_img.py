# Generated by Django 4.1.7 on 2024-06-14 19:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Base', '0013_alter_profile_profile_img'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='profile_img',
            field=models.ImageField(default='default.jpg', upload_to='profile_Images'),
        ),
    ]