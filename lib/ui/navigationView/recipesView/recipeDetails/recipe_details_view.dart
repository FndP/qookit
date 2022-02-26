import 'package:flutter/material.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/models/recipe.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipeDetailsWidgets/add_to_shopping.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipeDetailsWidgets/info_column.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipeDetailsWidgets/recipe_image.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipeDetailsWidgets/recipe_switch.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipeDetailsWidgets/subtitle_row.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipeDetailsWidgets/title_row.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipe_details_view_model.dart';
import 'package:stacked/stacked.dart';

class RecipeDetailsView extends StatelessWidget {

  final Recipe recipe;

  const RecipeDetailsView({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipeDetailsViewArguments arg = ModalRoute.of(context).settings.arguments;

    return ViewModelBuilder<RecipeDetailsViewModel>.reactive(
      viewModelBuilder: () => RecipeDetailsViewModel(),
      onModelReady: (model) => model.initialize(arg.recipe),
      builder: (context, model, child) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              RecipeImage(),
              TitleRow(),
              RecipeSwitch(),
              SubtitleRow(),
              InfoColumn(),
              SizedBox(
                height: 40,
              )
            ],
          ),
        );
      },
    );
  }
}
