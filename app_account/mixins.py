from django.http import Http404
from django.shortcuts import get_object_or_404
from app_blog.models import Post, Category, Slider, Comment, Contact
from app_event.models import Event
from app_account.models import Profile
from app_project.models import Project, PCategory
from django.contrib.auth.models import User
from app_event.forms import EventForm
from django.forms import ModelForm


class PostFieldsMixin(): 
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = ['title', 'slug', 'content', 'image', 'summary', 'category', 'user',  'status', 'file_url', 'youtube_url', 'github_url', 'refrence']
        elif request.user.profile.is_author:
            self.fields = ['title', 'slug', 'content', 'image', 'summary', 'category', 'file_url', 'youtube_url', 'github_url', 'refrence']
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class PostValidMixin():
    def form_valid(self, form):
        if self.request.user.profile.is_admin:
            form.save()
        else:
            self.obj = form.save(commit = False)
            self.obj.user = self.request.user
            self.obj.status = 'draft'
        return super().form_valid(form)

class CategoryFieldsMixin():
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = ['title', 'slug', 'description', 'mother']
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class EventFieldsMixin():
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = ['title','slug','description','summary','image','date','person','file_url','youtube_url','status']
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class UpdatePostMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        post = get_object_or_404(Post, pk=pk)
        if post.user == request.user or request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class UpdateCategoryMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        category = get_object_or_404(Category, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class UpdateEventMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        event = get_object_or_404(Event, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeletePostMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        post = get_object_or_404(Post, pk=pk)
        if post.user == request.user or request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeleteCategoryMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        category = get_object_or_404(Category, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeleteEventMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        event = get_object_or_404(Event, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class ProfileEditMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        profile = get_object_or_404(Profile, pk=pk)
        if request.user.profile.is_admin or request.user == profile.user:
            self.fields = ['bio', 'image', 'github', 'trello', 'instagram', 'email', 'linkedin', 'twitter'] 
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class SliderFieldsMixin():
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = ['title', 'image', 'link']
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class UpdateSliderMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        slide = get_object_or_404(Slider, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeleteSliderMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        slide = get_object_or_404(Slider, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class CommentFieldsMixin():
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = ['content', 'user', 'post', 'status']
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class UpdateCommentMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        comment = get_object_or_404(Comment, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeleteCommentMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        comment = get_object_or_404(Comment, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class ContactFieldsMixin():
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = ['title' ,'name' ,'mail' ,'phone' ,'subject' ,'message' ,'status']
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class UpdateContactMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        contact = get_object_or_404(Contact, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeleteContactMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        contact = get_object_or_404(Contact, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class PCategoryFieldsMixin():
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = ['title', 'slug']
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class UpdatePCategoryMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        category = get_object_or_404(PCategory, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeletePCategoryMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        category = get_object_or_404(PCategory, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class ProjectFieldsMixin():
    def dispatch(self, request, *args, **kwargs):
        if request.user.profile.is_admin:
            self.fields = '__all__'
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')
        return super().dispatch(request, *args, **kwargs)

class UpdateProjectMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        project = get_object_or_404(Project, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

class DeleteProjectMixin():
    def dispatch(self, request, *args, pk, **kwargs):
        project = get_object_or_404(Project, pk=pk)
        if request.user.profile.is_admin:
            return super().dispatch(request, *args, **kwargs)
        else:
            raise Http404('شما به این صفحه دسترسی ندارید')

    
    
    
    