from django.urls import path, include
from app_event import views

urlpatterns = [
    path('event/<str:slug>', views.event, name='event'),
    path('event', views.archive, name='event-archive')
]