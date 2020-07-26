from django.shortcuts import render
from app_project.models import Project, PCategory
from django.shortcuts import get_object_or_404

# Create your views here.
def projects(request):
    ctx = {}
    ctx['Category'] = PCategory.objects.all().order_by('-id')
    return render(request, 'project-page.html', ctx)

def projectcategory(request, slug):
    ctx = {}
    category = get_object_or_404(PCategory, slug=slug)
    ctx['Category'] = category
    ctx['Project'] = Project.objects.all().order_by('-id')
    return render(request, 'project-category.html', ctx)

def project(request, slug):
    ctx = {}
    project = get_object_or_404(Project, slug=slug)
    ctx['Project'] = project
    ctx['Sug'] = Project.objects.all().order_by('-id').exclude(slug=slug)[0:3]
    return render(request, 'project.html', ctx)


