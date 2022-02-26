import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipe_details_view_model.dart';
import 'package:stacked/stacked.dart';

class AddToShoppingList extends ViewModelWidget<RecipeDetailsViewModel> {
  @override
  Widget build(BuildContext context, RecipeDetailsViewModel model) {
    return Center(
      child: RaisedButton(
        child: Text('ADD TO SHOPPING LIST'),
        color: Colors.amber,
        onPressed: (){

        },
      ),
    );
  }

}
