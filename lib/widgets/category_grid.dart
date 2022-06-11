import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../provider/categories.dart';
import '../screens/category_detail.dart';

class CategoryGrid extends StatelessWidget {
  final String categoryId;

  CategoryGrid(this.categoryId);

  @override
  Widget build(BuildContext context) {
    Category category =
        Provider.of<Categories>(context).singleCategory(categoryId);

    return GridTile(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/category_detail',
            arguments: {
              'id': categoryId,
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: category.color,
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          alignment: Alignment.topCenter,
          child: Text(category.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
