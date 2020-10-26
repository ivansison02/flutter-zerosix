import 'package:flutter/material.dart';
import 'package:zerosix/pages/admin/add_product.dart';
import 'package:zerosix/pages/admin/add_store.dart';
import 'package:zerosix/pages/admin/home_admin.dart';
import 'package:zerosix/pages/admin/view_products.dart';
import 'package:zerosix/pages/admin/view_store.dart';
import 'package:zerosix/pages/customer/home_customer.dart';
import 'package:zerosix/pages/login.dart';
import 'package:zerosix/pages/splash.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    SplashPage.routeName: (context) => SplashPage(),
    LoginPage.routeName: (context) => LoginPage(),
    HomeCustomerPage.routeName: (context) => HomeCustomerPage(title: 'Home'),

    HomeAdminPage.routeName: (context) => HomeAdminPage(title: 'Home'),
    ViewStorePage.routeName: (context) => ViewStorePage(),
    StorePage.routeAddName: (context) => StorePage(title: 'New Store'),
    StorePage.routeUpdName: (context) => StorePage(title: 'Update Details'),
    ViewProductsPage.routeName: (context) => ViewProductsPage(title: 'Products'),
    ProductPage.routeAddName: (context) => ProductPage(title: 'New Product'),
    ProductPage.routeUpdName: (context) => ProductPage(title: 'Update Product'),
  },
));