from django.contrib import admin
<<<<<<< HEAD
from .models import *
=======
from .models import Courses, Products, Profile, ContactUs, Comments
>>>>>>> origin/master

# Register your models here.
class CourseAdmin(admin.ModelAdmin):
    list_display = ['course_name', 'course_id', 'price','created']
    list_per_page = 5
    list_filter = ['course_name', 'course_category','course_id','price','created']

class ProductsAdmin(admin.ModelAdmin):
    list_display = ['name', 'product_id', 'available', 'category','price', 'created']

class ProfileAdmin(admin.ModelAdmin):
<<<<<<< HEAD
    list_display = ['user', 'user_id','profile_img', 'country', 'city', 'date_of_birth']
=======
    list_display = ['user', 'user_id','profile_img', 'location', 'date_of_birth']
>>>>>>> origin/master
    
class ContactUsAdmin(admin.ModelAdmin):
    list_display = ['name', 'email', 'contactNumber', 'subject','sent_date']
    list_per_page = 5
    
class CommentAdmin(admin.ModelAdmin):
    list_display = ['user', 'id','message', 'comment_date',]
<<<<<<< HEAD
    
class TeamAdmin(admin.ModelAdmin):
    list_display = ['name', 'id','position', ]
=======
>>>>>>> origin/master

admin.site.register(Courses, CourseAdmin)
admin.site.register(Products, ProductsAdmin)
admin.site.register(Profile, ProfileAdmin)
admin.site.register(ContactUs, ContactUsAdmin)
<<<<<<< HEAD
admin.site.register(Comments, CommentAdmin)
admin.site.register(Enrollment)
admin.site.register(Team, TeamAdmin)
=======
admin.site.register(Comments, CommentAdmin)
>>>>>>> origin/master
