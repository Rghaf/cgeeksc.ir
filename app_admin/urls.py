from django.urls import path, include
from app_admin import views

urlpatterns = [
    path('dashboard', views.dashboard, name='dashboard'),
    path('dashboard/search-posts', views.postsearch, name='search-posts'),
]