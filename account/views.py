from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth import login, authenticate, logout
from django_user_agents.utils import get_user_agent

from .models import User
from mainapp.views import MainFrameView


# Create your views here.

class LoginView(MainFrameView):
    def get(self, request):
        self.update_top_bar(request)
        return render(request, 'account/login.html', self.context)

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        to = request.GET.get('next', None)
        account = authenticate(username=username, password=password)
        if account:
            if not request.POST.get('remember_me', None):
                request.session.set_expiry(0)
                print('dont remember me')
            login(request, account)
            if account.is_staff:
                return redirect('/admin')
            if to:
                return redirect(to)
            else:
                return redirect('/')
        else:
            self.context['message'] = 'Đăng nhập thất bại!'
            self.context['username'] = username
            return render(request, 'account/login.html', self.context)


class RegisterView(MainFrameView):
    def get(self, request):
        self.update_top_bar(request)
        return render(request, 'account/register.html', self.context)

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        repassword = request.POST.get('repassword')
        displayName = request.POST.get('displayName')
        gender = request.POST.get('gender')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        address = request.POST.get('address')
        err = False
        message = ''
        self.context.update({
            'username': username,
            'displayName': displayName,
            'phone': phone,
            'email': email,
            'address': address,
        })
        if username == '' or ' ' in username:
            message = message + 'Tên tài khoản không được để trống, không được chứa khoảng trắng. '
            err = True

        if len(User.objects.filter(username=username)) != 0:
            message = message + 'Tài khoản đã tồn tại. '
            err = True

        if password == '' or len(password) <= 3 or ' ' in password:
            message = message + 'Mật khẩu không được chứa khoảng trắng, phải > 3 ký tự. '
            err = True

        if password != repassword:
            message = message + 'Mật khẩu nhập không trùng nhau. '
            err = True

        if displayName.strip() == '':
            message = message + 'Tên hiển thị không được để trống. '
            err = True

        if int(gender) not in (0, 1, 2):
            message = message + 'Nà ní?<br/>'
            err = True

        if phone.strip() == '':
            message = message + 'Số điện thoại không được để trống. '
            err = True

        if address.strip() == '':
            message = message + 'Địa chỉ không được để trống. '
            err = True

        if not err:
            new_user = User.objects.create_user(
                username=username,
                password=password,
                displayName=displayName,
                gender=gender,
                phone=phone,
                email=email,
                defaultAddress=address)
            new_user.save()
            login(request, new_user)

            if request.GET.get('next', None) is None:
                return redirect('/')
            else:
                return redirect(request.GET.get('next'))
        else:
            self.context['message'] = message
            return render(request, 'account/register.html', context=self.context)


class MyAccountView(LoginRequiredMixin, MainFrameView):
    def get(self, request):
        self.update_top_bar(request)

        displayName = request.user.displayName
        phone = request.user.phone
        email = request.user.email
        address = request.user.defaultAddress
        self.context.update({
            'displayName': displayName,
            'phone': phone,
            'email': email,
            'address': address,
        })
        return render(request, 'account/my_account.html', context=self.context)

    def post(self, request):
        self.update_top_bar(request)
        old_password = request.POST.get('old_password')
        password = request.POST.get('password')
        repassword = request.POST.get('repassword')
        displayName = request.POST.get('displayName')
        gender = request.POST.get('gender')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        address = request.POST.get('address')
        err = False
        self.context.update({
            'displayName': displayName,
            'phone': phone,
            'email': email,
            'address': address,
        })

        context_err_message = {}

        if old_password != '':
            if not authenticate(username=request.user.username, password=old_password):
                context_err_message['old_password'] = 'Mật khẩu cũ không chính xác. '
                err = True
            print(authenticate(username=request.user.username, password=old_password))
            if password == '' or len(password) <= 3 or ' ' in password:
                context_err_message['password_message'] = 'Mật khẩu không được chứa khoảng trắng và phải > 3 ký tự. '
                err = True

            if password != repassword:
                context_err_message['repassword_message'] = 'Mật khẩu nhập không trùng nhau. '
                err = True

        if displayName.strip() == '':
            context_err_message['displayName_message'] = 'Tên sẽ được sử dụng để liên lạc, không được để trống. '
            err = True

        if int(gender) not in (0, 1, 2):
            context_err_message['gender_message'] = 'Nà ní? '
            err = True

        if phone.strip() == '':
            context_err_message['phone_message'] = 'Số điện thoại không được để trống. '
            err = True

        if address.strip() == '':
            context_err_message['address_message'] = 'Địa chỉ không được để trống. '
            err = True

        if not err:
            user = request.user
            user.set_password(raw_password=password)
            user.phone = phone
            user.displayName = displayName
            user.gender = gender
            user.email = email
            user.defaultAddress = address
            user.save()
            self.context['message'] = 'Đổi thông tin thành công'
            return render(request, 'account/my_account.html', context=self.context)
        else:
            self.context.update(context_err_message)
            return render(request, 'account/my_account.html', context=self.context)


def logout_view(request):
    logout(request)
    return redirect('/')


class ContactInfo(MainFrameView):
    def get(self, request, messenger_id):
        user_agent = get_user_agent(request)
        messenger_user = User.objects.filter(messengerId=messenger_id).first()
        context = {'messenger_user': messenger_user}

        if not messenger_user:
            return HttpResponse('Lỗi. Người dùng không tồn tại')

        if user_agent.is_mobile:
            return render(request, 'account/contact_info_mobile.html', context=context)
        else:
            self.update_top_bar(request)
            self.context.update(context)
            return render(request, 'account/contact_info_pc.html', context=self.context)

    def post(self, request, messenger_id):

        receiver = request.POST.get('receiver', None)
        phone = request.POST.get('phone', None)
        address = request.POST.get('defaultAddress', None)
        # messenger_id = request.POST.get('messenger_id', None)

        messenger_user = User.objects.filter(messengerId=messenger_id).first()

        if messenger_user and receiver and phone and address:
            messenger_user.displayName = receiver

            messenger_user.phone = phone
            messenger_user.defaultAddress = address
            messenger_user.save()
            context = {'messenger_user': messenger_user, 'message': 'Lưu thông tin thành công'}

        elif not messenger_user:
            return HttpResponse('<h1 style="color: red">Người dùng này không tồn tại</h1>')
        else:
            context = {'messenger_user': messenger_user, 'message': 'Vui lòng điền đầy đủ thông tin'}

        if get_user_agent(request).is_mobile:
            return render(request, 'account/contact_info_mobile.html', context=context)
        else:
            self.update_top_bar(request)
            self.context.update(context)

            return render(request, 'account/contact_info_pc.html', context=self.context)
