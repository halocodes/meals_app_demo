import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/screens/meal_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() {
    return _TabbarState();
  }
}

class _TabbarState extends State<TabBarScreen> {
  int selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(meals: filteredMeals);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen(onSelectCategory: _selectCategory);

    return Scaffold(
      appBar: AppBar(title: Text('Dynamic')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
      body: activeScreen,
    );
  }
}
