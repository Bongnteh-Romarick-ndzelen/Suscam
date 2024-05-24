from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('course/<str:pk>/', views.course, name='course'),
    path('search_results/', views.search_results, name='search_results'),
    path('courses/', views.courses, name='courses'),
    path('products/', views.products, name='products'),
    path('product/<str:pk>/', views.product, name='product'),
    path('about/', views.about, name='about'),
    path('profile/', views.profile, name='profile'),
    path('login/', views.login, name='login'),
    path('signup/', views.register, name='register'),
    path('logout/', views.logout, name='logout'),
]