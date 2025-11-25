import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onSelectCategory});

  final void Function(BuildContext context, Category category) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      children: [
        ...availableCategories.map((category) {
          return CategoryGridItem(
            category: category,
            onSelectCategory: onSelectCategory,
          );
        }),
      ],
    );
  }
}
