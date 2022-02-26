import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipes_search_bar.dart';
import 'package:qookit/ui/navigationView/recipesView/recipes_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:qookit/services/theme/theme_service.dart';

class RecipesHeader extends ViewModelWidget<RecipesViewModel> {
  @override
  Widget build(BuildContext context, RecipesViewModel model) {
    return LayoutBuilder(
      builder: (context, constraints) => AnimatedOpacity(
        opacity: 1 * ((constraints.maxHeight - 48) / 200),
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
                        style: headerStyle,
                      ),
                      if (!model.showSearchBar)
                        IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              model.toggleSearchBar();
                            })
                    ],
                  )),
              if (model.showSearchBar)Expanded(
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