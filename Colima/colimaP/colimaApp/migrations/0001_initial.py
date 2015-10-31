# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Admin',
            fields=[
                ('nombre_usr', models.CharField(max_length=10, serialize=False, primary_key=True)),
                ('pwd', models.CharField(max_length=12)),
            ],
            options={
                'db_table': 'admin',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'Categoria',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Participacion',
            fields=[
                ('idpart', models.AutoField(serialize=False, primary_key=True, db_column='idPart')),
                ('descrip', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'participacion',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pregunta',
            fields=[
                ('idpregunta', models.AutoField(serialize=False, primary_key=True, db_column='idPregunta')),
                ('descripcion', models.CharField(max_length=200)),
                ('latitud', models.FloatField()),
                ('longitud', models.FloatField()),
                ('urlvideo', models.CharField(max_length=200, null=True, db_column='urlVideo', blank=True)),
                ('nombre', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=24)),
                ('telefono', models.CharField(max_length=12)),
                ('fecha', models.DateTimeField()),
                ('contmail', models.IntegerField(db_column='contMail')),
                ('conttelefono', models.IntegerField(db_column='contTelefono')),
                ('contambos', models.IntegerField(db_column='contAmbos')),
            ],
            options={
                'db_table': 'pregunta',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Reporte',
            fields=[
                ('idreporte', models.AutoField(serialize=False, primary_key=True, db_column='idReporte')),
                ('descripcion', models.CharField(max_length=200)),
                ('latitud', models.FloatField()),
                ('longitud', models.FloatField()),
                ('urlvideo', models.CharField(max_length=200, null=True, db_column='urlVideo', blank=True)),
                ('nombre', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=24)),
                ('telefono', models.CharField(max_length=12)),
                ('fecha', models.DateTimeField()),
                ('contmail', models.IntegerField(db_column='contMail')),
                ('conttelefono', models.IntegerField(db_column='contTelefono')),
                ('contambos', models.IntegerField(db_column='contAmbos')),
            ],
            options={
                'db_table': 'reporte',
                'managed': False,
            },
        ),
    ]
