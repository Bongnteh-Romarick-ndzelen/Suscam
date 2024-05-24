from django.shortcuts import render, redirect
from .models import Courses, Products
from django.db.models import Q
from django.core.paginator import Paginator



# Create your views here.

#homepage
def index(request):
    products = Products.objects.all()[::-1][0:4]
    course  = Courses.objects.all()[::-1][0:4]
    context = {
        'course': course,
        'products': products,
        # 'search':search,
    }
    return render(request, 'Home/index.html', context)

#defining function to get a single course
def course(request, pk):
    course = Courses.objects.get(course_id=pk)
    course2 = Courses.objects.all()[0:6][::-1]
    products = Products.objects.all()[0:6][::-1]
    # products = product[0::6]
    context = {
        'course': course,
        'course2': course2,
        'products': products
        }
    return render(request, 'Courses/course.html', context)

def search_results(request):
    query = request.GET.get('query')
    referer = request.META.get('HTTP_REFERER') #get the referer url
    
    #check if query is empty or not
    if not query:
        if referer:
            return redirect(referer)
        else:
            return redirect('index')
    courses = Courses.objects.filter(
        Q(course_name__icontains=query) |
        Q(course_category__icontains=query) |
        Q(description__icontains=query) |
        Q(price__icontains=query)
    )
    products = Products.objects.filter(name__icontains=query)
    #print(query)
    
    
    search_results = list(products) + list(courses)
    total_found1 = courses.count()
    total_found2 = courses.count()
    total_found = total_found1 + total_found2
    context = {
        'search_results': search_results,
        'query': query,
        'total_found': total_found,
    }
    return render(request, 'Search/search_result.html', context)

def courses(request):
    course_list = Courses.objects.all()[::-1]
    total = Courses.objects.all().count()
    
    #adding paginator to contains 8 items per page
    paginator = Paginator(course_list, 4)
    
    #get current page number from the request GET parameters
    page_number = request.GET.get('page')
    
    #get the page object from the current page
    page_obj = paginator.get_page(page_number)
    
    #get slice list of item for the current page
    slice_courses = page_obj.object_list
    context = {
        'course_list': slice_courses,
        'total': total,
        'page_obj' : page_obj,
    }
    return render(request, 'Courses/courses.html', context)

#products Page List
def products(request):
    products = Products.objects.all()[::-1]
    total = Products.objects.all().count()
    #adding paginator to contains 8 items per page
    paginator = Paginator(products, 4)
    
    #get current page number from the request GET parameters
    page_number = request.GET.get('page')
    
    #get the page object from the current page
    page_obj = paginator.get_page(page_number)
    
    #get slice list of item for the current page
    slice_products = page_obj.object_list
    context = {
        'products': slice_products,
        'total': total,
        'page_obj' : page_obj,
    }
    return render(request, 'Products/products.html', context)

#function to get a Single Product
def product(request, pk):
    product1 = Products.objects.all()[::-1]
    product_list = product1[:6]
    courses = Courses.objects.all()[::-1][0:6]
    product = Products.objects.get(product_id=pk)
    context = {
        'product': product,
        'product_list': product_list,
        'courses': courses,
        }
    return render(request, 'Products/product.html', context)

def about(request):
    return render(request, 'About/about.html')

def profile(request):
    return render(request, 'Profile/profile.html')

def login(request):
    return render(request, 'Authenticate/login.html')

def register(request):
    return render(request, 'Authenticate/register.html')

def logout(request):
    return render(request, 'Authenticate/logout.html')