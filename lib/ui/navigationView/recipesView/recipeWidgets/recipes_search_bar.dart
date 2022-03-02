import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/app/strings.dart';
import 'package:stacked/stacked.dart';

class RecipesSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (searchTerm) {
        ExtendedNavigator.named('nestedNav').push(NavigationViewRoutes.recipeSearchView,
        arguments: RecipeSearchViewArguments(
          searchTerm: searchTerm
        ));
      },
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: Strings.recipeSearch,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
          size: 28,
        ),
        suffixIcon: IconButton(
          icon: FaIcon(FontAwesomeIcons.slidersH),
          onPressed: () {
            ExtendedNavigator.named('nestedNav').push(NavigationViewRoutes.recipeSearchView);
          },
        ),
        contentPadding: EdgeInsets.all(0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }
}
