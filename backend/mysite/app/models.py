from django.db import models
from django.utils import timezone
# Create your models here.
class user_Record(models.Model):
    username = models.CharField(max_length=64)
    registered_Date_Time = models.DateTimeField(default=timezone.now)
    
    def __str__(self):
        return self.username

class record(models.Model):
    username = models.CharField(max_length=64)
    processed_Date_Time = models.DateTimeField(default=timezone.now)
    name = models.CharField(max_length=64)
    number = models.CharField(max_length=64)

    def __str__(self):
        return self.name