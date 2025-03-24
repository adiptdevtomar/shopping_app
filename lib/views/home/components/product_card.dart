import 'package:add_to_cart_animated_button/add_to_cart.dart';
import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/utils/extensions/string_extensions.dart';
import 'package:bloc_project/utils/router/routes.dart';
import 'package:bloc_project/views/common_widgets/add_to_cart_button.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel model;

  const ProductCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.productView,
          arguments: model,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipSmoothRect(
                radius: SmoothBorderRadius(
                  cornerRadius: 30,
                  cornerSmoothing: 1,
                ),
                child: Image.network(
                  height: 190,
                  model.images?.firstOrNull ?? '',
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: AddToCartButton(
                  product: model,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            model.title ?? '',
            maxLines: 2,
            style: TextStyle(),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            model.price?.toDouble().formatPrice() ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
