import 'package:bloc_project/models/cart/cart_item_model.dart';
import 'package:bloc_project/models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<CartState> cartProvider = ChangeNotifierProvider(
  name: 'Cart Provider',
  (ref) => CartState(),
);

class CartState extends ChangeNotifier {
  Map<int, CartItemModel> localCart = {};

  void updateQuantityInCart(ProductModel model, int quantity) {
    if (model.id != null) {
      if (localCart.containsKey(model.id)) {
        final int currentItemQuantity = localCart[model.id!]?.quantity ?? 0;
        if (quantity > 0) {
          localCart[model.id!]?.quantity =
              (localCart[model.id!]?.quantity ?? 0) + quantity;
        } else {
          final requestRemoval = quantity.abs();
          if (requestRemoval >= currentItemQuantity) {
            localCart.remove(model.id);
          } else {
            localCart[model.id!]?.quantity =
                (localCart[model.id!]?.quantity ?? 0) + quantity;
          }
        }
      } else {
        localCart[model.id!] = CartItemModel(quantity: quantity, model: model);
      }
    }
    notifyListeners();
  }

  void checkout() {
    localCart.clear();
    notifyListeners();
  }
}
