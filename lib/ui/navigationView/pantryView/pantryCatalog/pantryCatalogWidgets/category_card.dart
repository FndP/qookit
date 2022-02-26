import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantry_catalog_view_model.dart';

class CategoryCard extends StatelessWidget {

  final PantryCategory category;

  const CategoryCard({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(category.coverImage)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(category.label,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
