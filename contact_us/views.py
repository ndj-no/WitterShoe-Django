from django.shortcuts import render
from django.views import View
from .models import Feedback
from mainapp.views import TopBarView


# Create your views here.
class contact_us_view(TopBarView):
    def get(self, request):
        self.update_top_bar(request)
        return render(request, 'contact_us/contact.html', context=self.context)

    def post(self, request):
        self.update_top_bar(request)

        name = request.POST.get('name')
        email = request.POST.get('email')
        subject = request.POST.get('subject')
        content = request.POST.get('content')
        err = False
        message = ''

        if name.strip() == '':
            message = 'Vui lòng điền đầy đủ họ tên'
            err = True
        if email.strip() == '':
            message = 'Vui lòng điền email/SDT để tiện liên lạc nếu cần thiết'
            err = True

        if content.strip() == '':
            message = 'Vui lòng điền nội dung'
            err = True
        if not err:
            message = 'Cảm ơn bạn đã liên lạc. Bọn mình sẽ liên lạc lại sớm nhất có thể.'
            fb = Feedback(name=name, subject=subject, email=email, content=content)
            fb.save()
        self.context.update({'message': message})
        return render(request, 'contact_us/contact.html', context=self.context)
