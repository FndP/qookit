import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipe_details_view_model.dart';
import 'package:stacked/stacked.dart';

class RecipeSwitch extends ViewModelWidget<RecipeDetailsViewModel> {
  @override
  Widget build(BuildContext context, RecipeDetailsViewModel model) {
    return Container(
        width: 400,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.black, width: 2)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: -2,
              left: model.selectedTab == 'ingredients' ? 0 : (170),
              right: model.selectedTab == 'ingredients' ? (170) : 0,
              child: Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        model.updateTab('ingredients');
                      },
                      child: Container(
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            style: GoogleFonts.openSans(
                                color: model.selectedTab == 'ingredients' ? Colors.white : Colors.black,
                                fontWeight: model.selectedTab == 'ingredients' ? FontWeight.w600 : FontWeight.w400),
                            duration: kThemeAnimationDuration,
                            child: Text(
                              'Ingredients',
                            ),
                          ),
                        ),
                        /*decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: model.selectedTab == 'ingredients'? Colors.black:Colors.transparent,
                      ),*/
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        model.updateTab('instructions');
                      },
                      child: Container(
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            duration: kThemeAnimationDuration,
                            style: GoogleFonts.openSans(
                                color: model.selectedTab == 'instructions' ? Colors.white : Colors.black,
                                fontWeight: model.selectedTab == 'instructions' ? FontWeight.w600 : FontWeight.w400),
                            child: Text(
                              'Instructions',
                            ),
                          ),
                        ),
                        /*decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: model.selectedTab == 'instructions'? Colors.black:Colors.transparent,
                      ),*/
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
