import 'package:bloc_project/models/products/products_request.dart';
import 'package:bloc_project/state/home_state.dart';
import 'package:bloc_project/views/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProducts extends ConsumerStatefulWidget {
  const HomeProducts({super.key});

  @override
  ConsumerState<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends ConsumerState<HomeProducts> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(homeProvider).product;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          model: products[index],
        );
      },
    );
  }
}
