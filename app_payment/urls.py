from django.urls import path, include
from app_payment import views

urlpatterns = [
    path('donate/', views.donate, name='donate'),
    # path('site-plans/', views.site_plans, name='site-plans'),
    path('send/', views.send_request, name='send-request'),
    path('verify/<int:amount>/', views.verify, name='verify')
]