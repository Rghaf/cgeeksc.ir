from django.contrib import admin
from django.urls import path, include
from django.contrib.sitemaps.views import sitemap
from app_blog.sitemaps import StaticViewSitemap, PostSitemap, CategorySitemap, EventSitemap, PCategorySitemap, ProjectSitemap, ProfileSitemap
from django.conf.urls import url
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from ckeditor_uploader.views import upload

sitemaps = {
    'static': StaticViewSitemap,
    'post': PostSitemap,
    'category': CategorySitemap,
    'event': EventSitemap,
    'pcategory': PCategorySitemap,
    'project': ProjectSitemap,
    'profile': ProfileSitemap,
}

urlpatterns = [
    path('admin/', admin.site.urls),
    # url(r'^login/$', views.LoginView.as_view(), name='login'),
    # url(r'^logout/$', views.LogoutView.as_view(), name='logout'),
    # url(r'^oauth/', include('social_django.urls', namespace='social')), 
    path('', include(('app_blog.urls', 'app_blog'), namespace='app-blog')),
    path('', include(('app_event.urls', 'app_event'), namespace='app-event')),
    path('', include(('app_account.urls', 'app_account'), namespace='app-account')),
    path('', include(('app_project.urls', 'app_project'), namespace='app-project')),
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps}),
    url(r'^ckeditor/upload/', login_required(upload), name='ckeditor_upload'),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    path('password_reset/',
     auth_views.PasswordResetView.as_view(template_name='password_reset_form.html'),
     name='password_reset'),
    path('password_reset/done/',
     auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html'),
     name='password_reset_done'),
    path('reset/(<uidb64>/<token>/',
     auth_views.PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html'), 
     name='password_reset_confirm'),
    path('reset/done/',
     auth_views.PasswordResetCompleteView.as_view(template_name='password_reset_complete.html'),
     name='password_reset_complete'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
