from django.shortcuts import render
from .models import user_Record, record
from django.http import HttpResponse, JsonResponse
import json
# Create your views here.
def home(request):
    return HttpResponse('<h3>Welcome to Custom Mockup API. Designed and developed by <a href="https://dewanshrawat.me/">Dewansh Rawat</a></h3>')

def create_user(request, username):
    x = user_Record.objects.filter(username=username)
    print(x)
    if len(x) != 0:
        return HttpResponse('Username already exists, please choose another')
    else:
        temp = user_Record()
        temp.username = username
        temp.save()
        return render(request, 'app/index.html', {'username': username})

def fetch(request, username):
    x = record.objects.filter(username=username)
    temp = []
    for i in x:
        name = i.name
        number = i.number
        data = {"name": name, "number": number}
        temp.append(data)
    y = json.dumps(temp)
    return HttpResponse(y)

def post(request, username):
    if request.method == 'POST':
        data = json.loads(request.body)
        temp = record()
        temp.username = username
        temp.name = data["name"]
        temp.number = data["number"]
        temp.save()
        return HttpResponse("Success")