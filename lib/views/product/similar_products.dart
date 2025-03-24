import 'package:bloc_project/models/products/similar_request.dart';
import 'package:bloc_project/state/cart_state.dart';
import 'package:bloc_project/state/product_view_state.dart';
import 'package:bloc_project/views/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimilarProducts extends ConsumerStatefulWidget {
  final int id;

  const SimilarProducts({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends ConsumerState<SimilarProducts> {
  @override
  void initState() {
    ref.read(productViewProvider(widget.id)).getProducts(
          request: SimilarRequest(id: widget.id),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productViewProvider(widget.id)).similarProducts;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Similar Products',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 12,
            ),
            shrinkWrap: true,
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 190,
                child: ProductCard(
                  model: products[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
