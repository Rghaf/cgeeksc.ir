from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from ckeditor_uploader.views import upload


urlpatterns = [
    path('admin/', admin.site.urls),
    # url(r'^login/$', views.LoginView.as_view(), name='login'),
    # url(r'^logout/$', views.LogoutView.as_view(), name='logout'),
    # url(r'^oauth/', include('social_django.urls', namespace='social')), 
    path('', include(('app_blog.urls', 'app_blog'), namespace='app-blog')),
    path('', include(('app_event.urls', 'app_event'), namespace='app-event')),
    path('', include(('app_account.urls', 'app_account'), namespace='app-account')),
    path('', include(('app_project.urls', 'app_project'), namespace='app-project')),
    url(r'^ckeditor/upload/', login_required(upload), name='ckeditor_upload'),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
