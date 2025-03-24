import 'package:bloc_project/state/home_state.dart';
import 'package:bloc_project/views/common_widgets/cart_badge.dart';
import 'package:bloc_project/views/home/components/categories.dart';
import 'package:bloc_project/views/home/components/home_products.dart';
import 'package:bloc_project/views/home/components/search_tile.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'SharpSell Store',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          CartBadge(),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification.metrics.pixels ==
                scrollNotification.metrics.maxScrollExtent) {
              ref.read(homeProvider).pagination();
            }
            return true;
          },
          child: ListView(
            children: [
              SearchTile(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Categories(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              HomeProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
