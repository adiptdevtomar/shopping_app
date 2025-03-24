import 'dart:developer';

import 'package:bloc_project/models/categories/categories_model.dart';
import 'package:bloc_project/models/categories/categories_request.dart';
import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/models/products/products_request.dart';
import 'package:bloc_project/network/api_client.dart';
import 'package:bloc_project/network/base_response.dart';
import 'package:bloc_project/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeChangeNotifierProvider<HomeState> homeProvider =
    AutoDisposeChangeNotifierProvider(
  name: 'Home Provider',
  (ref) => HomeState(),
);

class HomeState extends ChangeNotifier {
  HomeState() {
    getCategories(
      request: CategoriesRequest(limit: 10),
    );
    getProducts(
      request: ProductsRequest(offset: currentPage, limit: 10),
    );
  }

  int currentPage = 0;
  List<ProductModel> product = [];
  List<Category> categories = [];
  BaseResponse productsApiResponse = BaseResponse.init();
  BaseResponse categoriesApiResponse = BaseResponse.loading();

  Future<void> pagination() async {
    await getProducts(
      request: ProductsRequest(
        offset: currentPage + 1,
        limit: 10,
      ),
    );
  }

  Future<void> getProducts({
    required ProductsRequest request,
  }) async {
    if (productsApiResponse.status == Status.loading) {
      return;
    }

    currentPage = request.offset;

    productsApiResponse = BaseResponse.loading();
    notifyListeners();

    productsApiResponse = await ApiClient().get(
      path: ApiEndpoints.products,
      queryParameters: request.toJson(),
    );

    _handleGetProductsApi();
  }

  Future<void> _handleGetProductsApi() async {
    if (productsApiResponse.status == Status.success) {
      final List<dynamic> data = productsApiResponse.data;

      product.addAll(data
          .map(
            (e) => ProductModel.fromMap(e),
          )
          .toList());
      notifyListeners();
    }
  }

  Future<void> getCategories({
    required CategoriesRequest request,
  }) async {
    categoriesApiResponse = BaseResponse.loading();
    notifyListeners();

    categoriesApiResponse = await ApiClient().get(
      path: ApiEndpoints.categories,
      queryParameters: request.toJson(),
    );

    _handleGetCategoriesApi();
  }

  Future<void> _handleGetCategoriesApi() async {
    if (categoriesApiResponse.status == Status.success) {
      final List<dynamic> data = categoriesApiResponse.data;

      categories = data
          .map(
            (e) => Category.fromMap(e),
          )
          .toList();
      notifyListeners();
    }
  }
}
