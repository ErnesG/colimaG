from rest_framework import serializers
from .models import Admin, Categoria, Participacion, Pregunta, Reporte, Estadisticas

class AdminSerializer(serializers.ModelSerializer):
    class Meta:
        model=Admin
        fields=('nombre_usr','pwd')

class PregutaSerializer(serializers.ModelSerializer):
    class Meta:
        model=Pregunta
        fields=('idpregunta','descripcion','latitud','longitud','urlvideo','nombre','email','telefono','fecha','contmail','conttelefono','contambos')
class ReporteSerializer(serializers.ModelSerializer):
    class Meta:
        model=Reporte
        fields=('idreporte','tipopart','categoria','descripcion','latitud','longitud','urlvideo','nombre','email','telefono','fecha','contmail','conttelefono','contambos')
class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model=Categoria
        fields=('idC','nombre')
class EstadisticasReporteSerializer(serializers.ModelSerializer):
    class Meta:
        model=Estadisticas
        fields=('suenio','propongo','participo','total_reporte','total_preguntas')
