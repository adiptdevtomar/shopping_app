import 'package:bloc_project/state/cart_state.dart';
import 'package:bloc_project/utils/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartBadge extends ConsumerWidget {
  const CartBadge({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final int count = ref
        .watch(cartProvider)
        .localCart
        .values
        .fold(0, (previous, current) => previous + current.quantity);
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.cartView,
      ),
      child: Badge(
        isLabelVisible: count > 0,
        label: Text(
          count.toString(),
        ),
        child: Icon(
          Icons.shopping_cart,
        ),
      ),
    );
  }
}
