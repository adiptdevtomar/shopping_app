import 'package:add_to_cart_animated_button/add_to_cart.dart';
import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCartButton extends ConsumerWidget {
  final ProductModel product;

  const AddToCartButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider).localCart;
    final quantity = cart[product.id]?.quantity ?? 0;

    return AddToCart(
      width: quantity > 0 ? 100 : 50,
      height: 50,
      incrementIcon: Icon(
        Icons.add,
        color: Colors.green,
      ),
      decrementIcon: Icon(
        Icons.remove,
        color: Colors.green,
      ),
      counterTextStyle: TextStyle(
        color: Colors.green,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      initialText: Text(
        '+',
        style: TextStyle(
          color: Colors.green,
          fontSize: 30,
        ),
      ),
      initialBoxDecoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      counterBoxDecoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      value: quantity,
      onIncrement: (newQuantity) => {
        ref.read(cartProvider).updateQuantityInCart(
              product,
              1,
            ),
      },
      onDecrement: (newQuantity) => {
        ref.read(cartProvider).updateQuantityInCart(
              product,
              -1,
            ),
      },
      maxValue: 999,
    );
  }
}
