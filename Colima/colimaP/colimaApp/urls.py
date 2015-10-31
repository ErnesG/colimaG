from django.conf.urls import patterns ,url, include

from . import views
urlpatterns=[
 url(r'^login/$',views.loginAdmin),
 url(r'^preguntar/$',views.createNewQuestion),
 url(r'^reportar/$',views.createNewReport),
 url(r'^addCategory$',views.createNewCategory),
 url(r'^updateQuestion$',views.updateQuestion),
 url(r'^updateReport$',views.updateReport),
 url(r'^borraP/(?P<pk>[0-9]+)',views.deleteQuestion),
 url(r'^borraR/(?P<pk>[0-9]+)',views.deleteReport),
 url(r'^preguntas$',views.questionList),
 url(r'^reportes$',views.reportList),
 url(r'^categorias$',views.categList),
 url(r'^findReport/(?P<pk>[0-9]+)',views.findReport),
 url(r'^estadisticas$',views.estadisticas)
]
