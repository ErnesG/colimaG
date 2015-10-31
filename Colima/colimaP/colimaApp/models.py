# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models
class Estadisticas(models.Model):
    suenio=models.IntegerField()
    propongo=models.IntegerField()
    participo=models.IntegerField()
    total_reporte=models.IntegerField()
    total_preguntas=models.IntegerField()



class Categoria(models.Model):
    idC=models.AutoField(db_column='id', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'Categoria'


class Admin(models.Model):
    nombre_usr = models.CharField(primary_key=True, max_length=10)
    pwd = models.CharField(max_length=12)

    class Meta:
        managed = False
        db_table = 'admin'


class Participacion(models.Model):
    idpart = models.AutoField(db_column='idPart', primary_key=True)  # Field name made lowercase.
    descrip = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'participacion'


class Pregunta(models.Model):
    idpregunta = models.AutoField(db_column='idPregunta', primary_key=True)  # Field name made lowercase.
    descripcion = models.CharField(max_length=200)
    latitud = models.FloatField()
    longitud = models.FloatField()
    urlvideo = models.CharField(db_column='urlVideo', max_length=200, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=50)
    email = models.CharField(max_length=24)
    telefono = models.CharField(max_length=12)
    fecha = models.DateTimeField()
    contmail = models.IntegerField(db_column='contMail')  # Field name made lowercase.
    conttelefono = models.IntegerField(db_column='contTelefono')  # Field name made lowercase.
    contambos = models.IntegerField(db_column='contAmbos')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pregunta'


class Reporte(models.Model):
    idreporte = models.AutoField(db_column='idReporte', primary_key=True)  # Field name made lowercase.
    tipopart = models.ForeignKey(Participacion, db_column='tipoPart')  # Field name made lowercase.
    categoria = models.ForeignKey(Categoria)
    descripcion = models.CharField(max_length=200)
    latitud = models.FloatField()
    longitud = models.FloatField()
    urlvideo = models.CharField(db_column='urlVideo', max_length=200, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=50)
    email = models.CharField(max_length=24)
    telefono = models.CharField(max_length=12)
    fecha = models.DateTimeField()
    contmail = models.IntegerField(db_column='contMail')  # Field name made lowercase.
    conttelefono = models.IntegerField(db_column='contTelefono')  # Field name made lowercase.
    contambos = models.IntegerField(db_column='contAmbos')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'reporte'
