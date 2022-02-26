import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipeGroup/recipe_group.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipe_list_loading.dart';
import 'package:qookit/ui/navigationView/recipesView/recipes_view_model.dart';
import 'package:stacked/stacked.dart';

class AllRecipes extends ViewModelWidget<RecipesViewModel> {
  @override
  Widget build(BuildContext context, RecipesViewModel model) {
    return Builder(
      builder: (context) => CustomScrollView(slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverToBoxAdapter(
          child: model.fetchingSuggested?RecipeListLoadingIndicator():RecipeGroup(
              title: 'Just for you',
              subtitle: 'BASED ON YOUR PANTRY & PREFERENCES',
              recipes: model.suggestedRecipes)
        ),
        SliverToBoxAdapter(
            child: model.fetchingSuggested?RecipeListLoadingIndicator():RecipeGroup(
                title: 'Summer Picks',
                subtitle: 'SEASONAL RECIPES FROM OUR FAVORITE CHEFS',
                recipes: model.suggestedRecipes)
        ),
        SliverToBoxAdapter(
            child: model.fetchingSuggested?RecipeListLoadingIndicator():RecipeGroup(
                title: 'Healthy Choices',
                subtitle: 'ALL NATURAL, HEALTHY ALTERNATIVES',
                recipes: model.suggestedRecipes)
        ),
        SliverToBoxAdapter(
            child: model.fetchingSuggested?RecipeListLoadingIndicator():RecipeGroup(
                title: 'Healthy Choices',
                subtitle: 'ALL NATURAL, HEALTHY ALTERNATIVES',
                recipes: model.suggestedRecipes)
        ),
      ]),
    );
  }
}
