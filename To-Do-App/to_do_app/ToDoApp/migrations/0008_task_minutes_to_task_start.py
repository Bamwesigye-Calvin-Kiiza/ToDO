# Generated by Django 4.1.7 on 2023-05-20 11:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ToDoApp', '0007_userprofileinformation'),
    ]

    operations = [
        migrations.AddField(
            model_name='task',
            name='minutes_to_task_start',
            field=models.TimeField(null=True),
        ),
    ]
