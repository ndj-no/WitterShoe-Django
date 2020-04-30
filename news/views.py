from django.shortcuts import render
from mainapp.views import MainFrameView


# Create your views here.
class NewsView(MainFrameView):
    def get(self, request):
        self.update_top_bar(request)
        return render(request, 'news/news.html', self.context)
