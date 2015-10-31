from django.http import HttpResponse
import json
from django.utils import timezone
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render
from .models import Admin, Categoria, Participacion, Pregunta, Reporte, Estadisticas
from .serializers import AdminSerializer, PregutaSerializer, ReporteSerializer, CategoriaSerializer,EstadisticasReporteSerializer
# Create your views here.

@api_view(['POST'])
def loginAdmin(request):
    adm=request.data

    try:
        a = Admin.objects.get(nombre_usr=adm['nombre_usr'])
    except Admin.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    access=False;
    if a:
        if a.pwd==adm['pwd']:
            access=True
        else:
            access=False
    else:
        access=False
    if access:
        return HttpResponse(status=200)
    else:
        return HttpResponse(status=403)

#seccion de altas
@api_view(['POST'])
def createNewQuestion(request):
    questionRequest=request.data
    p=Pregunta(descripcion=questionRequest['descripcion'], latitud=questionRequest['latitud'], longitud=questionRequest['longitud'],urlvideo=questionRequest['urlvideo'],nombre=questionRequest['nombre'],email=questionRequest['email'],telefono=questionRequest['telefono'],fecha=timezone.now(),contmail=questionRequest['contmail'],conttelefono=questionRequest['conttelefono'],contambos=questionRequest['contambos'])
    print questionRequest

    p.save()


    return Response(status=status.HTTP_201_CREATED)
@api_view(['POST'])
def createNewReport(request):
    report=request.data
    part=Participacion.objects.get(idpart=report['tipopart'])
    categ=Categoria.objects.get(idC=report['categoria'])
    r=Reporte(tipopart=part,categoria=categ,descripcion=report['descripcion'], latitud=report['latitud'], longitud=report['longitud'],urlvideo=report['urlvideo'],nombre=report['nombre'],email=report['email'],telefono=report['telefono'],fecha=datetime.now(),contmail=report['contmail'],conttelefono=report['conttelefono'],contambos=report['contambos'])
    r.save()
    return Response(status=status.HTTP_201_CREATED)
@api_view(['POST'])
def createNewCategory(descrip):
    nom=descrip.data
    categ=Categoria(nombre=nom['Categoria'])
    categ.save()
    return Response(status=status.HTTP_201_CREATED)
#seccion de cambios
@api_view(['POST'])
def updateQuestion(request):
    questionRequest=request.data
    print questionRequest
    try:
        p=Pregunta.objects.get(idpregunta=questionRequest['idpregunta'])
    except Pregunta.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    p.descripcion=questionRequest['descripcion']
    p.latitud=questionRequest['latitud']
    p.longitud=questionRequest['longitud']
    p.urlvideo=questionRequest['urlvideo']
    p.email=questionRequest['email']
    p.telefono=questionRequest['telefono']
    p.save()
    return HttpResponse(status=202)
@api_view(['POST'])
def updateReport(request):
    report=request.data

    try:
        r=Reporte.objects.get(idreporte=report['idreporte'])
    except Reporte.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    categ=Categoria.objects.get(idC=report['categoria'])
    r.categoria=categ
    r.descripcion=report['descripcion']
    r.latitud=report['latitud']
    r.longitud=report['longitud']
    r.urlvideo=report['urlvideo']
    r.email=report['email']
    r.telefono=report['telefono']
    r.save()
    return HttpResponse(status=202)
@api_view(['POST'])
def updateCategory(request):
    cat = request.data
    try:
        c=Categoria.objects.get(idC=cat['idC'])
    except Categoria.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    c.nombre=cat['nombre']
    c.save()
    return HttpResponse(status=202)
# operaciones de borrado
@api_view(['GET'])
def deleteQuestion(request,pk):
    try:
        p=Pregunta.objects.get(idpregunta=pk)
        p.delete()
    except Pregunta.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    return HttpResponse(status=200)
@api_view(['GET'])
def deleteReport(request,pk):
    try:
        r=Reporte.objects.get(idreporte=pk)
        r.delete()
    except Reporte.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    return HttpResponse(status=200)
#listado preguntas
@api_view(['GET'])
def questionList(request):
    ql=Pregunta.objects.all()
    serializer=PregutaSerializer(ql,many=True)
    return Response(serializer.data)
@api_view(['GET'])
def reportList(request):
    rl=Reporte.objects.all()
    serializer=ReporteSerializer(rl,many=True)
    return Response(serializer.data)
@api_view(['GET'])
def categList(request):
    cl=Categoria.objects.all()
    serializer=CategoriaSerializer(cl,many=True)
    return Response(serializer.data)

    
@api_view(['GET'])
def findReport(request,pk):
    r=Reporte.objects.get(idreporte=pk)
    serializer=ReporteSerializer(r)
    return Response(serializer.data)
@api_view(['GET'])
def estadisticas(request):
    ys=Participacion.objects.get(idpart=1)
    ypr=Participacion.objects.get(idpart=2)
    ypa=Participacion.objects.get(idpart=3)

    tys=Reporte.objects.filter(tipopart=ys).count()
    tpr=Reporte.objects.filter(tipopart=ypr).count()
    tpa=Reporte.objects.filter(tipopart=ypa).count()
    print tpa

    total=Reporte.objects.count()
    totalPregunt=Pregunta.objects.count()

    estadistica=Estadisticas(suenio=tys,propongo=tpr,participo=tpa,total_reporte=total,total_preguntas=totalPregunt)
    serializer=EstadisticasReporteSerializer(estadistica)


    return Response(serializer.data)
