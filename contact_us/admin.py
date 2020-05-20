from django.contrib import admin
from .models import Feedback


class FeedbackAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'subject', 'dateSend', 'read')
    list_display_links = ('name', 'subject')


admin.site.register(Feedback, FeedbackAdmin)
