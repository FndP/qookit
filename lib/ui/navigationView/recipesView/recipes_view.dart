import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/flexible_recipes.dart';
import 'package:qookit/ui/navigationView/recipesView/recipes_view_model.dart';
import 'package:stacked/stacked.dart';

class RecipesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipesViewModel>.reactive(
      viewModelBuilder: () => RecipesViewModel(),
      builder: (context, model, child) {
      return SafeArea(child: DefaultTabController(
        length: 3,
        child: Scaffold(
         body: FlexibleRecipes(),
        ),
      ));
    },);
  }
}