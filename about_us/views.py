from django.shortcuts import render
from mainapp.views import TopBarView


# Create your views here.
class AboutUsView(TopBarView):
    def get(self, request):
        self.update_top_bar(request)
        return render(request, 'about_us/about_us.html', context=self.context)
