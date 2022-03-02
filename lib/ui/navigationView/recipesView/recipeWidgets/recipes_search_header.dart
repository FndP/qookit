import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeSearch/recipe_search_view_model.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipes_search_bar.dart';
import 'package:stacked/stacked.dart';

class RecipesSearchHeader extends ViewModelWidget<RecipeSearchViewModel> {
  @override
  Widget build(BuildContext context, RecipeSearchViewModel model) {
    return LayoutBuilder(
      builder: (context, constraints) => AnimatedOpacity(
        //opacity: 1 * ((constraints.maxHeight - 48) / 200),
        opacity: 1,
        duration: Duration(milliseconds: 0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recipes',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  )),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                        child: RecipesSearchBar()
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}