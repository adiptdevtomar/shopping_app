import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/state/cart_state.dart';
import 'package:bloc_project/views/common_widgets/add_to_cart_button.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bloc_project/utils/extensions/string_extensions.dart';

class CartItem extends ConsumerWidget {
  final ProductModel model;

  const CartItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity =
        ref.watch(cartProvider).localCart[model.id]?.quantity ?? 0.0;

    return SizedBox(
      height: 80,
      child: Row(
        children: [
          ClipSmoothRect(
            radius: SmoothBorderRadius(
              cornerRadius: 15,
              cornerSmoothing: 1,
            ),
            child: Image.network(
              height: 80,
              width: 80,
              model.images?.firstOrNull ?? '',
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title ?? '',
                  maxLines: 2,
                ),
                Text(
                  ((model.price ?? 0) * quantity).toDouble().formatPrice(),
                )
              ],
            ),
          ),
          AddToCartButton(
            product: model,
          ),
        ],
      ),
    );
  }
}
