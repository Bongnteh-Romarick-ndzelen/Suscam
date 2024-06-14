[33mcommit 8a28dd7caf3ebaa65413432131234f4cf638098b[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Bongnteh-Romarick-ndzelen <124588664+Bongnteh-Romarick-ndzelen@users.noreply.github.com>
Date:   Fri Jun 14 15:46:45 2024 +0100

    Updating my app 14-June-2024

[1mdiff --git a/Base/__pycache__/admin.cpython-311.pyc b/Base/__pycache__/admin.cpython-311.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..5622e5a[m
Binary files /dev/null and b/Base/__pycache__/admin.cpython-311.pyc differ
[1mdiff --git a/Base/__pycache__/apps.cpython-311.pyc b/Base/__pycache__/apps.cpython-311.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..42cfb6b[m
Binary files /dev/null and b/Base/__pycache__/apps.cpython-311.pyc differ
[1mdiff --git a/Base/__pycache__/forms.cpython-311.pyc b/Base/__pycache__/forms.cpython-311.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..207eadf[m
Binary files /dev/null and b/Base/__pycache__/forms.cpython-311.pyc differ
[1mdiff --git a/Base/__pycache__/models.cpython-311.pyc b/Base/__pycache__/models.cpython-311.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..48cfab3[m
Binary files /dev/null and b/Base/__pycache__/models.cpython-311.pyc differ
[1mdiff --git a/Base/__pycache__/urls.cpython-311.pyc b/Base/__pycache__/urls.cpython-311.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..d5e56a7[m
Binary files /dev/null and b/Base/__pycache__/urls.cpython-311.pyc differ
[1mdiff --git a/Base/__pycache__/views.cpython-311.pyc b/Base/__pycache__/views.cpython-311.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..597f4d6[m
Binary files /dev/null and b/Base/__pycache__/views.cpython-311.pyc differ
[1mdiff --git a/Base/admin.py b/Base/admin.py[m
[1mnew file mode 100644[m
[1mindex 0000000..3b435fe[m
[1m--- /dev/null[m
[1m+++ b/Base/admin.py[m
[36m@@ -0,0 +1,27 @@[m
[32m+[m[32mfrom django.contrib import admin[m
[32m+[m[32mfrom .models import Courses, Products, Profile, ContactUs, Comments[m
[32m+[m
[32m+[m[32m# Register your models here.[m
[32m+[m[32mclass CourseAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_display = ['course_name', 'course_id', 'price','created'][m
[32m+[m[32m    list_per_page = 5[m
[32m+[m[32m    list_filter = ['course_name', 'course_category','course_id','price','created'][m
[32m+[m
[32m+[m[32mclass ProductsAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_display = ['name', 'product_id', 'available', 'category','price', 'created'][m
[32m+[m
[32m+[m[32mclass ProfileAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_display = ['user', 'user_id','profile_img', 'location', 'date_of_birth'][m
[32m+[m[41m    [m
[32m+[m[32mclass ContactUsAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_display = ['name', 'email', 'contactNumber', 'subject','sent_date'][m
[32m+[m[32m    list_per_page = 5[m
[32m+[m[41m    [m
[32m+[m[32mclass CommentAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_display = ['user', 'id','message', 'comment_date',][m
[32m+[m
[32m+[m[32madmin.site.register(Courses, CourseAdmin)[m
[32m+[m[32madmin.site.register(Products, ProductsAdmin)[m
[32m+[m[32madmin.site.register(Profile, ProfileAdmin)[m
[32m+[m[32madmin.site.register(ContactUs, ContactUsAdmin)[m
[32m+[m[32madmin.site.register(Comments, CommentAdmin)[m
\ No newline at end of file[m
[1mdiff --git a/Base/apps.py b/Base/apps.py[m
[1mnew file mode 100644[m
[1mindex 0000000..87b3cd3[m
[1m--- /dev/null[m
[1m+++ b/Base/apps.py[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32mfrom django.apps import AppConfig[m
[32m+[m
[32m+[m
[32m+[m[32mclass BaseConfig(AppConfig):[m
[32m+[m[32m    default_auto_field = 'django.db.models.BigAutoField'[m
[32m+[m[32m    name = 'Base'[m
[1mdiff --git a/Base/forms.py b/Base/forms.py[m
[1mnew file mode 100644[m
[1mindex 0000000..431ccbc[m
[1m--- /dev/null[m
[1m+++ b/Base/forms.py[m
[36m@@ -0,0 +1,133 @@[m
[32m+[m[32mfrom django import forms[m
[32m+[m[32mfrom django.contrib.auth.forms import UserCreationForm[m
[32m+[m[32mfrom .models import ContactUs, Comments[m
[32m+[m[32mfrom django.core.validators import RegexValidator[m
[32m+[m
[32m+[m
[32m+[m[32m#convert email and other fields to lowercase[m
[32m+[m[32mclass Lowercase(forms.CharField):[m
[32m+[m[32m    def to_python(self, value):[m
[32m+[m[32m        return value.lower()[m
[32m+[m
[32m+[m[32mclass Capitalize(forms.CharField):[m
[32m+[m[32m    def to_python(self, value):[m
[32m+[m[32m        return value.capitalize()[m
[32m+[m
[32m+[m[32mclass CustomUserCreationForm(UserCreationForm):[m
[32m+[m[41m    [m
[32m+[m[32m    email = forms.EmailField(required=True,[m
[32m+[m[32m                            widget=forms.EmailInput(attrs={'placeholder': 'Enter Your Email...'}),[m
[32m+[m[32m                            label=False,[m
[32m+[m[32m                            )[m
[32m+[m[41m    [m
[32m+[m[32m    field_order = ['username','email', 'password1', 'password2'][m
[32m+[m[32m    def __init__(self, *args, **kwargs):[m
[32m+[m[32m        super().__init__(*args, **kwargs)[m
[32m+[m[41m        [m
[32m+[m[32m        # Remove default help text[m
[32m+[m[32m        self.fields['username'].help_text = None[m
[32m+[m[32m        self.fields['password1'].help_text = None[m
[32m+[m[32m        self.fields['password2'].help_text = None[m
[32m+[m[41m        [m
[32m+[m[32m        # Remove field labels[m
[32m+[m[32m        self.fields['password1'].label = False[m
[32m+[m[32m        self.fields['password2'].label = False[m
[32m+[m[32m        self.fields['username'].label = False[m
[32m+[m[41m        [m
[32m+[m[32m        # Add placeholders[m
[32m+[m[32m        self.fields['password1'].widget.attrs['placeholder'] = 'Enter Your Password...'[m
[32m+[m[32m        self.fields['password2'].widget.attrs['placeholder'] = 'Confirm Password...'[m
[32m+[m[32m        self.fields['username'].widget.attrs['placeholder'] = 'Username...'[m
[32m+[m[41m        [m
[32m+[m[32m        # Customize error messages[m
[32m+[m[32m        self.fields['username'].error_messages = {[m
[32m+[m[32m            'required': 'Please enter a username.',[m
[32m+[m[32m            'max_length': 'Username cannot exceed 150 characters.',[m
[32m+[m[32m            'unique': 'This username is already taken.',[m
[32m+[m[32m            # Add more custom error messages as needed[m
[32m+[m[32m        }[m
[32m+[m[32m        self.fields['password1'].error_messages = {[m
[32m+[m[32m            'required': 'Custom password field required message',[m
[32m+[m[41m            [m
[32m+[m[32m            # Add more custom error messages as needed[m
[32m+[m[32m        }[m
[32m+[m[32m        self.fields['password2'].error_messages = {[m
[32m+[m[32m            'required': 'Please confirm your password.',[m
[32m+[m[32m            'min_length': 'Password must be at least 8 characters long.',[m
[32m+[m[32m            'password_mismatch': 'Passwords do not match.',[m
[32m+[m[32m            # Add more custom error messages as needed[m
[32m+[m[32m        }[m
[32m+[m[41m        [m
[32m+[m[32mclass ContactForm(forms.ModelForm):[m
[32m+[m[32m#VALIDATION[m
[32m+[m[32m    name = Capitalize([m
[32m+[m[32m        label='Name',min_length=5,max_length=200,[m
[32m+[m[32m        validators=[RegexValidator(r'^[a-zA-Z\s]*$',[m
[32m+[m[32m        message = "Only letters are allowed")],[m
[32m+[m[32m        widget=forms.TextInput(attrs={[m
[32m+[m[32m                                        'placeholder': 'Enter your name...',[m
[32m+[m[32m                                        'style': 'margin-top: auto, margin-bottom: auto,padding:0, border: 10px solid #0f0f0f',[m
[32m+[m[32m                                        }[m
[32m+[m[32m                                )[m
[32m+[m[32m    )[m
[32m+[m[32m    email = Lowercase([m
[32m+[m[32m        label='Email Address',min_length=10,max_length=50,[m
[32m+[m[32m        validators=[RegexValidator(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$',[m
[32m+[m[32m        message = "Put a valid email address"[m
[32m+[m[32m        )],[m
[32m+[m[32m        widget=forms.TextInput(attrs={[m
[32m+[m[32m                                        'placeholder': 'Enter your Email Address...',[m
[32m+[m[32m                                        'style': 'margin-top: auto, margin-bottom: auto,padding:0',[m
[32m+[m[32m                                    }[m
[32m+[m[32m                                ),[m
[32m+[m[32m    )[m
[32m+[m
[32m+[m[32m    subject = forms.CharField([m
[32m+[m[32m        label='Subject',min_length=5,max_length=200,[m
[32m+[m[32m        validators=[RegexValidator(r'^[a-zA-Z\s.-_]*$',[m
[32m+[m[32m        message = "Only letters are allowed!")],[m
[32m+[m[32m        widget=forms.TextInput(attrs={[m
[32m+[m[32m                                        'placeholder': 'Subject....',[m
[32m+[m[32m                                        'style': 'margin-top: auto, margin-bottom: auto,padding:0',[m
[32m+[m[32m                                        }[m
[32m+[m[32m                                ),[m
[32m+[m[32m        required=False[m
[32m+[m[32m    )[m
[32m+[m[32m    contactNumber = forms.CharField([m
[32m+[m[32m        label='Phone Number', min_length=7,max_length=200,[m
[32m+[m[32m        validators=[RegexValidator(r'^[0-9]',[m
[32m+[m[32m        message = "Only digits are allowed!")],[m
[32m+[m[32m        widget=forms.TextInput(attrs={[m
[32m+[m[32m                                        'placeholder': 'Enter Your Phone Number....',[m
[32m+[m[32m                                        'style': 'margin-top: auto, margin-bottom: auto,padding:0',[m
[32m+[m[32m                                        }[m
[32m+[m[32m                                ),[m
[32m+[m[32m        required=False[m
[32m+[m[32m    )[m
[32m+[m[41m    [m
[32m+[m[32m    message = forms.CharField([m
[32m+[m[32m        label='message',min_length=20, max_length=1000,[m
[32m+[m[32m        widget=forms.Textarea(attrs={[m
[32m+[m[32m                                        'placeholder': 'Type a Message ...',[m
[32m+[m[32m                                        'style': 'margin-top: auto, margin-bottom: auto,padding:0',[m
[32m+[m[32m                                        'rows':4[m
[32m+[m[32m                                    }[m
[32m+[m[32m                            )[m
[32m+[m[32m    )[m
[32m+[m[32m    class Meta:[m
[32m+[m[32m        model = ContactUs[m
[32m+[m[32m        fields = ['name', 'email','contactNumber', 'subject', 'message'][m
[32m+[m
[32m+[m[32mclass CommentForm(forms.ModelForm):[m
[32m+[m[32m    message = forms.CharField([m
[32m+[m[32m        label='Comment', max_length=1000,[m
[32m+[m[32m        widget=forms.Textarea(attrs={[m
[32m+[m[32m                                        'placeholder': 'Type Your Comment ...',[m
[32m+[m[32m                                        'style': 'margin-top: auto, margin-bottom: auto,padding:0',[m
[32m+[m[32m                                        'rows':4,[m
[32m+[m[32m                                    }[m
[32m+[m[32m                            )[m
[32m+[m[32m    )[m
[32m+[m[32m    class Meta:[m
[32m+[m[32m        model = Comments[m
[32m+[m[32m        fields = ['user', 'message', ][m
\ No newline at end of file[m
[1mdiff --git a/Base/migrations/0001_initial.py b/Base/migrations/0001_initial.py[m
[1mnew file mode 100644[m
[1mindex 0000000..5aab17b[m
[1m--- /dev/null[m
[1m+++ b/Base/migrations/0001_initial.py[m
[36m@@ -0,0 +1,52 @@[m
[32m+[m[32m# Generated by Django 4.1.7 on 2024-05-16 19:18[m
[32m+[m
[32m+[m[32mimport django.core.validators[m
[32m+[m[32mfrom django.db import migrations, models[m
[32m+[m[32mimport django.utils.timezone[m
[32m+[m
[32m+[m
[32m+[m[32mclass Migration(migrations.Migration):[m
[32m+[m
[32m+[m[32m    initial = True[m
[32m+[m
[32m+[m[32m    dependencies = [[m
[32m+[m[32m    ][m
[32m+[m
[32m+[m[32m    operations = [[m
[32m+[m[32m        migrations.CreateModel([m
[32m+[m[32m            name='Comments',[m
[32m+[m[32m            fields=[[m
[32m+[m[32m                ('name', models.CharField(max_length=100)),[m
[32m+[m[32m                ('id', models.AutoField(primary_key=True, serialize=False)),[m
[32m+[m[32m                ('message', models.TextField()),[m
[32m+[m[32m            ],[m
[32m+[m[32m        ),[m
[32m+[m[32m        migrations.CreateModel([m
[32m+[m[32m            name='Courses',[m
[32m+[m[32m            fields=[[m
[32m+[m[32m                ('course_id', models.UUIDField(primary_key=True, serialize=False, unique=True)),[m
[32m+[m[32m                ('course_name', models.CharField(max_length=250)),[m
[32m+[m[32m                ('description', models.TextField()),[m
[32m+[m[32m                ('price', models.IntegerField(default=1000)),[m
[32m+[m[32m                ('old_price', models.IntegerField()),[m
[32m+[m[32m                ('course_img', models.ImageField(upload_to='CourseImage/', validators=[django.core.validators.FileExtensionValidator(allowed_extensions=['jpg', 'png', 'jpeg'])])),[m
[32m+[m[32m                ('created', models.DateTimeField(default=django.utils.timezone.now)),[m
[32m+[m[32m                ('updated', models.DateTimeField(auto_now=True)),[m
[32m+[m[32m            ],[m
[32m+[m[32m        ),[m
[32m+[m[32m        migrations.CreateModel([m
[32m+[m[32m            name='Products',[m
[32m+[m[32m            fields=[[m
[32m+[m[32m                ('name', models.CharField(max_length=100)),[m
[32m+[m[32m                ('product_id', models.BigAutoField(primary_key=True, serialize=False)),[m
[32m+[m[32m                ('product_des', models.TextField()),[m
[32m+[m[32m                ('price', models.DecimalField(decimal_places=2, max_digits=10)),[m
[32m+[m[32m                ('old_price', models.DecimalField(decimal_places=2, max_digits=10)),[m
[32m+[m[32m                ('category', models.CharField(max_length=100)),[m
[32m+[m[32m                ('available', models.BooleanField(default=True)),[m
[32m+[m[32m                ('updated', models.DateTimeField(auto_now_add=True, null=True)),[m
[32m+[m[32m                ('created', models.DateTimeField(default=django.utils.timezone.now)),[m
[32m+[m[32m                ('image', models.ImageField(upload_to='Product_Images', validators=[django.core.validators.FileExtensionValidator(allowed_extensions=['jpg', 'png', 'jpeg'])])),[m
[32m+[m[32m            ],[m
[32m+[m[32m        ),[m
[32m+[m[32m    ][m
[1mdiff --git a/Base/migrations/0002_alter_courses_course_id.py b/Base/migrations/0002_alter_courses_course_id.py[m
[1mnew file mode 100644[m
[1mindex 0000000..6615cbe[m
[1m--- /dev/null[m
[1m+++ b/Base/migrations/0002_alter_courses_course_id.py[m
[36m@@ -0,0 +1,18 @@[m
[32m+[m[32m# Generated by Django 4.1.7 on 2024-05-16 19:23[m
[32m+[m
[32m+[m[32mfrom django.db import migrations, models[m
[32m+[m
[32m+[m
[32m+[m[32mclass Migration(migrations.Migration):[m
[32m+[m
[32m+[m[32m    dependencies = [[m
[32m+[m[32m        ('Base', '0001_initial'),[m
[32m+[m[32m    ][m
[32m+[m
[32m+[m[32m    operations = [[m
[32m+[m[32m        migrations.AlterField([m
[32m+[m[32m            model_name='courses',[m
[32m+[m[32m            name='course_id',[m
[32m+[m[32m            field=models.BigAutoField(primary_key=True, serialize=False),[m
[32m+[m[32m        ),[m
[32m+[m[32m    ][m
[1mdiff --git a/Base/migrations/0003_courses_course_category.py b/Base/migrations/0003_courses_course_category.py[m
[1mnew file mode 100644[m
[1mindex 0000000..b74dc2a[m
[1m--- /dev/null[m
[1m+++ b/Base/migrations/0003_courses_course_category.py[m
[36m@@ -0,0 +1,18 @@[m
[32m+[m[32m# Generated by Django 4.1.7 on 2024-05-16 22:27[m
[32m+[m
[32m+[m[32mfrom django.db import migrations, models[m
[32m+[m
[32m+[m
[32m+[m[32mclass Migration(migrations.Migration):[m
[32m+[m
[32m+[m[32m    dependencies = [[m
[32m+[m[32m        ('Base', '0002_alter_courses_course_id'),[m
[32m+[m[32m    ][m
[32m+[m
[32m+[m[32m    operations = [[m
[32m+[m[32m        migrations.AddField([m
[32m+[m[32m            model_name='courses',[m
[32m+[m[32m            name='course_category',[m
[32m+[m[32m            field=models.CharField(blank=True, max_length=250, null=True),[m
[32m+[m[32m        ),[m
[32m+[m[32m    ][m
[1mdiff --git a/Base/migrations/0004_alter_courses_old_price_alter_courses_price.py b/Base/migrations/0004_alter_courses_old_price_alter_courses_price.py[m
[1mnew file mode 100644[m
[1mindex 0000000..d54b0cf[m
[1m--- /dev/null[m
[1m+++ b/Base/migrations/0004_alter_courses_old_price_alter_courses_price.py[m
[36m@@ -0,0 +1,23 @@[m
[32m+[m[32m# Generated by Django 4.1.7 on 2024-05-20 06:12[m
[32m+[m
[32m+[m[32mfrom django.db import migrations, models[m
[32m+[m
[32m+[m
[32m+[m[32mclass Migration(migrations.Migration):[m
[32m+[m
[32m+[m[32m    dependencies = [[m
[32m+[m[32m        ('Base', '0003_courses_course_category'),[m
[32m+[m[32m    ][m
[32m+[m
[32m+[m[32m    operations = [[m
[32m+[m[32m        migrations.AlterField([m
[32m+[m[32m            model_name='courses',[m
[32m+[m[32m            name='old_price',[m
[32m+[m[32m            field=models.DecimalField(decimal_places=2, max_digits=10),[m
[32m+[m[32m        ),[m
[32m+[m[32m        migrations.AlterField([m
[32m+[m[32m            model_name='courses',[m
[32m+[m[32m            name='price',[m
[32m+[m[32m            field=models.DecimalField(decimal_places=2, default=1000, max_digits=10),[m
[32m+[m[32m        ),[m
[32m+[m[32m    ][m
[1mdiff --git a/Base/migrations/0005_profile.py b/Base/migrations/0005_profile.py[m
[1mnew file mode 100644[m
[1mindex 0000000..dadea1c[m
[1m--- /dev/null[m
[1m+++ b/Base/migrations/0005_profile.py[m
[36m@@ -0,0 +1,28 @@[m
[32m+[m[32m# Generated by Django 4.1.7 on 2024-05-25 14:10[m
[32m+[m
[32m+[m[32mfrom django.conf import settings[m
[32m+[m[32mfrom django.db import migrations, models[m
[32m+[m[32mimport django.db.models.deletion[m
[32m+[m
[32m+[m
[32m+[m[32mclass Migration(migrations.Migration):[m
[32m+[m
[32m+[m[32m    dependencies = [[m
[32m+[m[32m        migrations.swappable_dependency(settings.AUTH_USER_MODEL),[m
[32m+[m[32m        ('Base', '0004_alter_courses_old_price_alter_courses_price'),[m
[32m+[m[32m    ][m
[32m+[m
[32m+[m[32m    operations = [[m
[32m+[m[32m        migrations.CreateModel([m
[32m+[m[32m            name='Profile',[m
[32m+[m[32m            fields=[[m
[32m+[m[32m                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),[m
[32m+[m[32m                ('id_user', models.IntegerField()),[m
[32m+[m[32m                ('bio', models.TextField(blank=True)),[m
[32m+[m[32m                ('profile_img', models.ImageField(default='default.png', upload_to='profile_Images')),[m
[32m+[m[32m                ('location', models.CharField(blank=True, max_length=100)),[m
[32m+[m[32m                ('date_of_birth', models.DateField(blank=True, null=True)),[m
[32m+[m[32m                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),[m
[32m+[m[32m            ],[m
[32m+[m[32m        ),[m
[32m+[m[32m    ][m
[1mdiff --git a/Base/migrations/0006_contactus.py b/Base/migrations/0006_contactus.py[m
[1mnew file mode 100644[m
[1mindex 0000000..4c854ed[m
[1m--- /dev/null[m
[1m+++ b/Base/migrations/0006_contactus.py[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32m# Generated by Django 4.1.7 on 2024-05-29 18:38[m
[32m+[m
[32m+[m[32mfrom django.db import migrations, models[m
[32m+[m
[32m+[m
[32m+[m[32mclass Migration(migrati