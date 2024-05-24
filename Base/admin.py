from django.contrib import admin
from .models import Courses, Products

# Register your models here.
class CourseAdmin(admin.ModelAdmin):
    list_display = ['course_name', 'course_id', 'price','created']

class ProductsAdmin(admin.ModelAdmin):
    list_display = ['name', 'product_id', 'available', 'category','price', 'created']

admin.site.register(Courses, CourseAdmin)
admin.site.register(Products, ProductsAdmin)