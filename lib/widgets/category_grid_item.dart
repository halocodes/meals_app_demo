import 'package:flutter/material.dart';
import 'package:mealapp/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final void Function(BuildContext context, Category category) onSelectCategory;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Theme.of(context).colorScheme.primary.withAlpha(100),
        onTap: () => onSelectCategory(context, category),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                category.color.withValues(alpha: 0.4),
                category.color.withValues(alpha: 0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
