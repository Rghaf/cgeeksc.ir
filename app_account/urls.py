from django.urls import path, include
from app_account import views
from app_account.views import ProfileView, PostCreateView, CategoryCreateView, EventCreateView, PostUpdateView, PostDeleteView, CategoryUpdateView, EventUpdateView, CategoryDeleteView, EventDeleteView, SliderCreateView, SliderUpdateView, SlideDeleteView, CommentUpdateView, CommentDeleteView, ContactDeleteView, PCategoryCreateView, PCategoryUpdateView, PCategoryDeleteView, ProjectCreateView, ProjectUpdateView, ProjectDeleteView

urlpatterns = [
    #login
    path('login/', views.loginview, name='login'),
    path('register/', views.registerview, name='register'),
    path('logout/', views.logoutview, name='logout'),
    
    path('profile/<str:username>', views.profile, name='profile'),
    # lists
    path('dashboard', views.dashboard, name='dashboard'),
    path('dashboard/messages', views.MessageView, name='messages'),
    path('dashboard/category', views.catdashboard, name='dashboard-categoty'),
    path('dashboard/event', views.eventdashboard, name='dashboard-event'),
    path('dashboard/draftposts', views.draftposts, name='draftposts'),
    path('dashboard/myposts', views.myposts, name='myposts'),
    path('dashboard/finishedevents', views.finishedevents, name='finishedevents'),
    path('dashboard/comments', views.comments, name='comments'),
    path('dashboard/draftcomments', views.draftcomments, name='draftcomments'),
    path('dashboard/pcategory', views.pcategory, name='dashboard-pcategoty'),
    path('dashboard/projects', views.projects, name='dashboard-project'),
    path('dashboard/slider', views.sliders, name='dashboard-slider'),
    # create
    path('dashboard/add-post', PostCreateView.as_view(), name='add-post'),
    path('dashboard/add-category', CategoryCreateView.as_view(), name='add-category'),
    path('dashboard/add-event', EventCreateView.as_view(), name='add-event'),
    path('dashboard/add-slide', SliderCreateView.as_view(), name='add-slide'),
    path('dashboard/add-pcategory', PCategoryCreateView.as_view(), name='add-pcategory'),
    path('dashboard/add-project', ProjectCreateView.as_view(), name='add-project'),
    # edit
    path('dashboard/edit-post/<int:pk>', PostUpdateView.as_view(), name='edit-post'),
    path('dashboard/edit-category/<int:pk>', CategoryUpdateView.as_view(), name='edit-category'),
    path('dashboard/edit-event/<int:pk>', EventUpdateView.as_view(), name='edit-event'),
    path('dashboard/edit-slide/<int:pk>', SliderUpdateView.as_view(), name='edit-slide'),
    path('dashboard/edit-comment/<int:pk>', CommentUpdateView.as_view(), name='edit-comment'),
    path('dashboard/edit-pcategory/<int:pk>', PCategoryUpdateView.as_view(), name='edit-pcategory'),
    path('dashboard/edit-project/<int:pk>', ProjectUpdateView.as_view(), name='edit-project'),
    # delete
    path('dashboard/delete-post/<int:pk>', PostDeleteView.as_view(), name='delete-post'),
    path('dashboard/delete-category/<int:pk>', CategoryDeleteView.as_view(), name='delete-category'),
    path('dashboard/delete-event/<int:pk>', EventDeleteView.as_view(), name='delete-event'),
    path('dashboard/delete-slide/<int:pk>', SlideDeleteView.as_view(), name='delete-slide'),
    path('dashboard/delete-comment/<int:pk>', CommentDeleteView.as_view(), name='delete-comment'),
    path('dashboard/delete-message/<int:pk>', ContactDeleteView.as_view(), name='delete-message'),
    path('dashboard/delete-pcategory/<int:pk>', PCategoryDeleteView.as_view(), name='delete-pcategory'),
    path('dashboard/delete-project/<int:pk>', ProjectDeleteView.as_view(), name='delete-project'),

    path('dashboard/profile/<int:pk>', ProfileView.as_view(), name='dashboard-profile'),
]