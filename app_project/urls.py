from django.urls import path, include
from app_project import views

urlpatterns = [
    path('projects/<str:slug>', views.project, name='project'),
    path('projects-category/<str:slug>', views.projectcategory, name='projectcategory'),
    path('projects', views.projects, name='projects'),
]