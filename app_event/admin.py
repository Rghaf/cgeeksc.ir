from django.contrib import admin
from app_event.models import Event

# Register your models here.
class EventAdmin(admin.ModelAdmin):
    list_display = ('title', 'person' ,'date', 'status')
    list_filter = ('status', 'date')
    search_fields = ('title', 'description')

admin.site.register(Event, EventAdmin)
