import 'package:bloc_project/models/products/product_model.dart';
import 'package:bloc_project/state/cart_state.dart';
import 'package:bloc_project/utils/extensions/string_extensions.dart';
import 'package:bloc_project/utils/router/routes.dart';
import 'package:bloc_project/views/cart/cart_item.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProductModel> cart = ref
        .watch(cartProvider)
        .localCart
        .values
        .map(
          (e) => e.model,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: (cart.isEmpty)
          ? Center(
              child: Text('Cart Empty'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: cart.length,
                  padding: EdgeInsets.all(12),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return CartItem(
                      model: cart[index],
                    );
                  },
                ),
              ],
            ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider).checkout();
                  Navigator.popUntil(
                    context,
                    (route) => route.settings.name == Routes.homeView,
                  );
                  Fluttertoast.showToast(
                    msg: 'Purchase Successful',
                  );
                },
                child: Text('Pay Now'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
