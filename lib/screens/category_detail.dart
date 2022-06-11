import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/categories.dart';
import '../provider/meals.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_card.dart';

class CategoryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryMap =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String categoryId = categoryMap['id'].toString();

    Category category =
        Provider.of<Categories>(context).singleCategory(categoryId);

    List<Meal> mealsList = Provider.of<Meals>(context).mealsList(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: mealsList.map(
            (meal) {
              return MealCard(meal);
            },
          ).toList(),
        ),
      ),
    );
  }
}
