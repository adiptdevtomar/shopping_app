import 'package:bloc_project/models/categories/categories_model.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  final Category model;

  const CategoriesCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          ClipSmoothRect(
            radius: SmoothBorderRadius(
              cornerRadius: 20,
              cornerSmoothing: 1,
            ),
            child: Image.network(
              height: 100,
              model.image ?? '',
            ),
          ),
          Text(model.name ?? ''),
        ],
      ),
    );
  }
}
