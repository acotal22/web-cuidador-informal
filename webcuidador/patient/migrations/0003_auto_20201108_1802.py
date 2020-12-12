# Generated by Django 3.0.5 on 2020-11-08 21:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('patient', '0002_auto_20201108_1644'),
    ]

    operations = [
        migrations.AlterField(
            model_name='paciente',
            name='estado_civil',
            field=models.CharField(choices=[('Casado(a)', 'Casado(a)'), ('Soltero(a)', 'Soltero(a)')], default='Soltero', max_length=10, verbose_name='Estado Civil'),
        ),
    ]
