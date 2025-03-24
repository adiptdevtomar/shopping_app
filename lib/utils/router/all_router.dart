import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/utils/router/routes.dart';
import 'package:bloc_project/views/cart/cart_view.dart';
import 'package:bloc_project/views/home/home_view.dart';
import 'package:bloc_project/views/product/product_view.dart';
import 'package:bloc_project/views/search/search_view.dart';
import 'package:flutter/material.dart';

class AllRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );
      case Routes.productView:
        final ProductModel model = settings.arguments as ProductModel;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ProductView(
            product: model,
          ),
        );
      case Routes.cartView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CartView(),
        );
      case Routes.searchView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SearchView(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Route Not Found'),
            ),
          ),
        );
    }
  }
}
