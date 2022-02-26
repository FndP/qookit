// Recipe groups show up in the ALL recipes tab
// Recipe groups should be given a list of recipes, a title, and a subtitle
// In the future, defining the query that creates each recipe group will also be useful

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qookit/app/dimensions.dart';
import 'package:qookit/models/recipe.dart';
import 'package:qookit/models/recipe_list.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipe_card.dart';
import 'package:qookit/services/theme/theme_service.dart';

class RecipeGroup extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Recipe> recipes;

  const RecipeGroup({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: headerStyle.copyWith(fontSize: 24),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {
                      // Go to recipe group page/feed
                    })
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                subtitle,
                style: subheaderStyle,
              ),
            ],
          ),
        ),
        Flexible(
          child: Container(
            height: Dimensions.recipeCardHeight+50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recipes != null? recipes.length: 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: recipes[index],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
