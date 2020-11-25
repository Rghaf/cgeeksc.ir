from django.http import HttpResponse
from django.urls import reverse
from django.shortcuts import redirect, render
from zeep import Client

MERCHANT = '9a311a51-1b48-4ff6-b07b-fe5bb30694f6'
client = Client('https://www.zarinpal.com/pg/services/WebGate/wsdl')
  # Toman / Required
description = "توضیحات مربوط به تراکنش را در این قسمت وارد کنید"  # Required
email = 'email@example.com'  # Optional
mobile = '09123456789'  # Optional
# CallbackURL = 'http://localhost:8000/verify/' # Important: need to edit for realy server.

def donate(request):
    if request.method == 'POST':
        amount = request.POST['amount']
        CallbackURL = 'http://localhost:8000' + reverse('app-payment:verify', args=(amount, ))
        result = client.service.PaymentRequest(MERCHANT, amount, description, email, mobile, CallbackURL)
        if result.Status == 100:
            return redirect('https://www.zarinpal.com/pg/StartPay/' + str(result.Authority))
        else:
            return HttpResponse('Error code: ' + str(result.Status))
    return render(request, 'donate.html')

def send_request(request):
    amount = request.POST['amount']
    result = client.service.PaymentRequest(MERCHANT, amount, description, email, mobile, CallbackURL)
    if result.Status == 100:
        return redirect('https://www.zarinpal.com/pg/StartPay/' + str(result.Authority))
    else:
        return HttpResponse('Error code: ' + str(result.Status))

def verify(request, amount):
    if request.GET.get('Status') == 'OK':
        result = client.service.PaymentVerification(MERCHANT, request.GET['Authority'], amount)
        if result.Status == 100:
            return HttpResponse('Transaction success.\nRefID: ' + str(result.RefID))
        elif result.Status == 101:
            return HttpResponse('Transaction submitted : ' + str(result.Status))
        else:
            return HttpResponse('Transaction failed.\nStatus: ' + str(result.Status))
    else:
        return HttpResponse('Transaction failed or canceled by user')
