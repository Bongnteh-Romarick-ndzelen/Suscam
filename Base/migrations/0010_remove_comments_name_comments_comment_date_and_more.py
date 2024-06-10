# Generated by Django 4.1.7 on 2024-06-10 08:27

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Base', '0009_alter_contactus_options_alter_profile_id_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comments',
            name='name',
        ),
        migrations.AddField(
            model_name='comments',
            name='comment_date',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='comments',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
    ]
