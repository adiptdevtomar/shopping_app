import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/views/common_widgets/add_to_cart_button.dart';
import 'package:bloc_project/views/product/similar_products.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;

  const ProductView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            ClipSmoothRect(
              radius: SmoothBorderRadius(
                cornerRadius: 30,
                cornerSmoothing: 1,
              ),
              child: Image.network(
                product.images?.firstOrNull ?? '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
              child: SizedBox(
                height: 90,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.category?.name ?? '',
                          ),
                          Expanded(
                            child: Text(
                              product.title ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 100,
                      child: AddToCartButton(
                        product: product,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                product.description ?? '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SimilarProducts(
                  id: product.id ?? 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
