# Generated by Django 3.0.5 on 2020-12-12 00:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('content', '0009_auto_20201122_2013'),
    ]

    operations = [
        migrations.AddField(
            model_name='topico',
            name='url_infografia',
            field=models.URLField(null=True, verbose_name='URL Infografía'),
        ),
    ]
