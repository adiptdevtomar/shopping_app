import 'package:bloc_project/models/categories/categories_model.dart';
import 'package:bloc_project/state/home_state.dart';
import 'package:bloc_project/views/home/components/categories_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final List<Category> category = ref.watch(homeProvider).categories;
    return SizedBox(
      height: 120.0,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 12,
        ),
        shrinkWrap: true,
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoriesCard(
          model: category[index],
        ),
      ),
    );
  }
}
