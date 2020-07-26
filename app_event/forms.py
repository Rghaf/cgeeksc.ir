from django import forms
from django.forms import ModelForm
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from app_event.models import Event

class EventForm(forms.Form):
    title = forms.CharField(max_length = 250)
    slug = forms.SlugField(max_length = 200)
    description = forms.CharField(widget=CKEditorUploadingWidget()) 
    summary = forms.CharField(max_length = 250)
    # date
    # person
    # file_url
    # youtube_url
    # status = ChoiceField
