import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipe_details_view_model.dart';
import 'package:stacked/stacked.dart';

class SubtitleRow extends ViewModelWidget<RecipeDetailsViewModel> {
  @override
  Widget build(BuildContext context, RecipeDetailsViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,
      vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (model.selectedTab == 'ingredients')
            Text(
              'INGREDIENTS',
              style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.transparent,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0,-5)
                    )
                  ],
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.amber),
            ),
          if (model.selectedTab == 'ingredients')
            Row(
              children: [
                IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: () {
                  model.changeServing(-1);
                }),
                Text(model.servings.toString() + ' Servings'),
                IconButton(icon: Icon(Icons.add_circle_outline_outlined), onPressed: () {
                  model.changeServing(1);
                })
              ],
            ),
          if (model.selectedTab == 'instructions')
            Row(
              children: [
                Text(
                  'INSTRUCTIONS',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.transparent,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0,-5)
                        )
                      ],
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Colors.amber),
                ),
                IconButton(icon: Icon(Icons.add_circle_outline_outlined,color: Colors.transparent,), onPressed: null)
              ],
            )
        ],
      ),
    );
  }
}
