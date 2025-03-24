import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/models/products/similar_request.dart';
import 'package:bloc_project/network/api_client.dart';
import 'package:bloc_project/network/base_response.dart';
import 'package:bloc_project/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productViewProvider =
    AutoDisposeChangeNotifierProvider.family<ProductViewState, int>(
  name: 'Product View Provider',
  (ref, arg) => ProductViewState(),
);

class ProductViewState extends ChangeNotifier {
  BaseResponse productsApiResponse = BaseResponse.loading();
  List<ProductModel> similarProducts = [];

  Future<void> getProducts({
    required SimilarRequest request,
  }) async {
    // productsApiResponse = BaseResponse.loading();
    // notifyListeners();

    productsApiResponse = await ApiClient().get(
      path: ApiEndpoints.similarProducts(request.id),
      queryParameters: request.toJson(),
    );

    _handleGetProductsApi();
  }

  Future<void> _handleGetProductsApi() async {
    if (productsApiResponse.status == Status.success) {
      final List<dynamic> data = productsApiResponse.data;

      similarProducts = data
          .map(
            (e) => ProductModel.fromMap(e),
          )
          .toList();
      notifyListeners();
    }
  }
}
