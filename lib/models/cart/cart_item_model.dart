import 'package:bloc_project/models/products/product_model.dart';

class CartItemModel {
  ProductModel model;
  int quantity;

  CartItemModel({
    required this.quantity,
    required this.model,
  });
}
