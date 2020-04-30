from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth import login, authenticate, logout
from .models import User
from mainapp.views import MainFrameView


# Create your views here.

class LoginView(MainFrameView):
    def get(self, request):
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
            self.context.update({'message': 'Tài khoản hoặc mật khẩu không chính xác!'})
            return render(request, 'account/login.html', self.context)


class RegisterView(MainFrameView):
    def get(self, request):
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


def logoutView(request):
    logout(request)
    return redirect('/')
