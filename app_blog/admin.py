from django.contrib import admin
from app_blog.models import Post, Category, Slider, Comment, Contact

# Register your models here.

class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'publish_date', 'status')
    list_filter = ('status', 'publish_date', 'category')
    search_fields = ('title', 'content')

admin.site.register(Post, PostAdmin)
admin.site.register(Category)
admin.site.register(Slider)
admin.site.register(Comment)
admin.site.register(Contact)