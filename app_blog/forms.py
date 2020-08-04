from django import forms
from app_blog.models import Post, Comment, Contact

class AddComment(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('content', )
    def __init__(self, *args, **kwargs):
        super(AddComment, self).__init__(*args, **kwargs) # Call to ModelForm constructor
        self.fields['content'].widget.attrs['style'] = 'width:80%;'

class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = ('title', 'name', 'mail', 'phone', 'subject', 'message')
        
