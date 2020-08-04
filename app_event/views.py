from django.shortcuts import render
from django.http import HttpResponse
from app_blog.models import Category
from app_event.models import Event
from django.core.paginator import Paginator

def event(request, slug):
    ctx = {}
    ctx['Event'] = Event.objects.get(slug=slug)
    ctx['Sug'] = Event.objects.all().order_by('-id').exclude(slug=slug)[0:3]
    return render(request, 'event.html', ctx)

def archive(request):
    ctx = {}
    event_list = Event.objects.all().order_by('-date')
    page = request.GET.get('page', 1)
    paginator = Paginator(event_list, 7)
    try:
        events = paginator.page(page)
    except PageNotAnInteger:
        events = paginator.page(1)
    except EmptyPage:
        events = paginator.page(paginator.num_pages)
    ctx['Event'] = events
    return render(request, 'event-archive.html', ctx)

