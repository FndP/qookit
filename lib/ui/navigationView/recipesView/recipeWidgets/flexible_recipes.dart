import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/recipesView/allRecipes/all_recipes.dart';
import 'package:qookit/ui/navigationView/recipesView/favoriteRecipes/favorites_recipe.dart';
import 'package:qookit/ui/navigationView/recipesView/myRecipes/my_recipes.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipes_header.dart';
import 'package:qookit/ui/navigationView/recipesView/recipes_view_model.dart';
import 'package:stacked/stacked.dart';

class FlexibleRecipes extends ViewModelWidget<RecipesViewModel> {
  @override
  Widget build(BuildContext context, RecipesViewModel viewModel) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: FlexibleRecipesHeader(),
        )
      ],
      body: FlexibleRecipesContent(),
    );
  }
}

class FlexibleRecipesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        AllRecipes(),
        MyRecipesView(),
        FavoritesView(),
      ],
    );
  }

}

class FlexibleRecipesHeader extends ViewModelWidget<RecipesViewModel> {
  @override
  Widget build(BuildContext context, RecipesViewModel viewmodel) {
    return SliverAppBar(
      leading: null,
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      elevation: 4,
      pinned: true,
      floating: true,
      flexibleSpace: RecipesHeader(),
      backgroundColor: Colors.white,
      stretch: true,
      snap: true,
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.amber,
        labelColor: Colors.amber,
        labelStyle: TextStyle(color: Colors.amber, fontWeight: FontWeight.w600),
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(text: 'ALL'),
          Tab(text: 'MY RECIPES'),
          Tab(text: 'FAVORITES'),
        ],
      ),
    );
  }
}