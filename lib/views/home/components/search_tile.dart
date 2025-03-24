import 'package:bloc_project/utils/router/routes.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.searchView),
      child: Container(
        height: 50,
        decoration: ShapeDecoration(
          color: Colors.grey.withOpacity(0.3),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 20,
              cornerSmoothing: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 6,
            ),
            Text(
              'Search',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
