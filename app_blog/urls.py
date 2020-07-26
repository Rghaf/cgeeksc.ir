from django.urls import path, include
from app_blog import views

urlpatterns = [
    path('', views.home, name='home'),
    path('search', views.search, name='search'),
    path('contact-us', views.contact, name='contact'),
    path('post/<str:slug>', views.post, name='post'),
    path('comment-reply/<int:post_id>/<int:comment_id>', views.commentreply, name='comment-reply'),
    path('category/<str:slug>', views.category, name='category'),
    path('posts', views.post, name='post-archive'),
    path('categores', views.post, name='category-archive'),
]