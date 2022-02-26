import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/app/dimensions.dart';
import 'package:qookit/models/recipe.dart';
import 'package:stacked/stacked.dart';

class MyRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const MyRecipeCard({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sideLength = MediaQuery.of(context).size.width / 2 - 32;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            ExtendedNavigator.named('nestedNav').push(
              NavigationViewRoutes.recipeDetailsView,
              arguments: RecipeDetailsViewArguments(
                recipe: recipe,
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(16),
            width: sideLength,
            height: sideLength,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://health.clevelandclinic.org/wp-content/uploads/sites/3/2019/06/cropped-GettyImages-643764514.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  // TODO: replace with actual source
                  Positioned.fill(
                      child: Container(
                    height: Dimensions.recipeCardHeight,
                    width: Dimensions.recipeCardWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )),
                  )),
                  Positioned(
                    bottom: 16,
                    left: 8,
                    child: Text(
                      'KATE + COOKIE',
                      style: TextStyle(fontWeight: FontWeight.w700, color: Colors.amber),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  recipe.title,
                  style: GoogleFonts.lato(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
