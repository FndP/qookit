import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/recipesView/myRecipes/add_recipe_card.dart';
import 'package:qookit/ui/navigationView/recipesView/myRecipes/my_recipe_card.dart';
import 'package:qookit/ui/navigationView/recipesView/myRecipes/my_recipes_view_model.dart';
import 'package:stacked/stacked.dart';

class MyRecipesView extends StatelessWidget {
  //ValueListenable myRecipes = userService.myRecipesListenable;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyRecipesViewModel>.reactive(
        viewModelBuilder: () => MyRecipesViewModel(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(model.hasError){
            return Center(
              child: Column(
                children: [
                  Text(model.error().toString()),
                  LinearProgressIndicator(),
                ],
              ),
            );
          }
          else {
            print('model data: ' + model.data.toString());
            return CustomScrollView(slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                childAspectRatio: .8),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index == 0) {
                      return AddRecipeCard();
                    } else {
                      return MyRecipeCard(recipe: model.data[index]);
                    }
                  },
                  childCount: model.data.length - 1
                ),
              )
            ]);
          }
        });
  }
}