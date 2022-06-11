import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/categories.dart';
import '../widgets/category_grid.dart';

class CategoriesOverviewScreen extends StatelessWidget {
  const CategoriesOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<Categories>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 30,
          ),
          itemBuilder: (c, index) {
            return CategoryGrid(categories.getCategories[index].id);
          },
          itemCount: categories.getCategories.length,
        ),
      ),
    );
  }
}
