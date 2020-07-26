from django import template
from app_blog.models import Category

register = template.Library()

@register.simple_tag
def title():
    return 'سلام تست'

@register.inclusion_tag("category_navbar.html")
def category_navbar():
    return {"Navcat": Category.objects.all()}