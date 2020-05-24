import re


def validate_email(email: str):
    regex = r'^[a-z0-9]+([\._]?[a-z0-9]+)+[@]\w+[.]\w{2,3}$'

    if re.search(regex, email):
        return True
    else:
        return False


def validate_phone(phone: str):
    if phone is None or phone == '':
        return False
    elif phone.strip() == '':
        return False

    n_digit = 0
    for d in phone:
        if not d.isdigit() and d != '+' and d != ' ':
            return False
        if d.isdigit():
            n_digit += 1
    if n_digit >= 10:
        return True
    else:
        return False
