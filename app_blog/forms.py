from django import forms
from app_blog.models import Post, Comment, Contact

class AddComment(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('content', )

class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = '__all__'
        
