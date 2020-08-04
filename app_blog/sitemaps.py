from django.contrib.sitemaps import Sitemap
from django.shortcuts import reverse
from app_blog.models import Post, Category
from app_event.models import Event
from app_project.models import Project, PCategory
from app_account.models import Profile

class StaticViewSitemap(Sitemap):
    def items(self):
        return ['app-blog:home', 'app-blog:contact', 'app-blog:search',
                'app-account:login', 'app-account:register',
                'app-event:event-archive',
                'app-project:projects'
        ]
    def location(self, item):
        return reverse(item)

class PostSitemap(Sitemap):
    def items(self):
        return Post.objects.all()

class CategorySitemap(Sitemap):
    def items(self):
        return Category.objects.all()

class EventSitemap(Sitemap):
    def items(self):
        return Event.objects.all()

class PCategorySitemap(Sitemap):
    def items(self):
        return PCategory.objects.all()

class ProjectSitemap(Sitemap):
    def items(self):
        return Project.objects.all()

class ProfileSitemap(Sitemap):
    def items(self):
        return Profile.objects.all()