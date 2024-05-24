from django.core.validators import FileExtensionValidator
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
import re
import uuid
from django.db import models
from django.utils import timezone

# def Validate_Course_id(value):
#     pattern = r'^(?!.*(.).*\1)[a-zA-Z0-9-]{36}$'
#     if not re.match(pattern, str(value)):
#         raise ValidationError('Course id must contains at least 4 different characters!')

# Create your models here.
class Courses(models.Model):
    course_id = models.BigAutoField(primary_key=True)
    course_name = models.CharField(max_length=250)
    description = models.TextField()
    #video =models.
    course_category = models.CharField(max_length=250, blank=True, null=True)
    price = models.DecimalField( default=1000, max_digits=10, decimal_places=2)
    old_price = models.DecimalField(max_digits=10, decimal_places=2)
    course_img = models.ImageField(upload_to='CourseImage/', validators = [FileExtensionValidator(allowed_extensions=['jpg', 'png', 'jpeg'])])
    created = models.DateTimeField(default = timezone.now)
    updated = models.DateTimeField(auto_now=True)
    #ratings = models.
    model_type = 'Course'
    
    
    def save(self, *args, **kwargs):
        if not self.course_id:
            self.created = timezone.now()
        self.updated = timezone.now()
        return super(Courses, self).save(*args, **kwargs)

    def __str__(self):
        return self.course_name

#create Products model
class Products(models.Model):
    name = models.CharField(max_length=100)
    product_id = models.BigAutoField(primary_key=True)
    product_des = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    old_price = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.CharField(max_length=100)
    available = models.BooleanField(default=True)
    updated = models.DateTimeField(auto_now_add=True, null=True)
    created = models.DateTimeField(default = timezone.now)
    image = models.ImageField(upload_to='Product_Images', validators = [FileExtensionValidator(allowed_extensions=['jpg', 'png', 'jpeg'])])
    model_type = 'Products'
    #rating = models

class Comments(models.Model):
    name = models.CharField(max_length=100)
    id = models.AutoField( primary_key=True)
    message = models.TextField()
    
    def __str__(self):
        return self.message