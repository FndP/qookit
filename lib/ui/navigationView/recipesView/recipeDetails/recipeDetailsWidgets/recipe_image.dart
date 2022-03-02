import 'package:flutter/material.dart';
import 'package:qookit/app/placeholders.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipe_details_view_model.dart';
import 'package:stacked/stacked.dart';
import 'dart:math';

class RecipeImage extends ViewModelWidget<RecipeDetailsViewModel> {
  @override
  Widget build(BuildContext context, RecipeDetailsViewModel model) {
    Random random = Random();
    int index = random.nextInt(Placeholders().dummyRecipeImages.length);

    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      model.recipe.sourceDetail != null
                          ? model.recipe.sourceDetail.imageUrls.first
                          : Placeholders().dummyRecipeImages[index],
                    ),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              top: 8,
              left: 8,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                fillColor: Colors.white,
                shape: CircleBorder(),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black54,
                ),
              )),
          Positioned(
              top: 8,
              right: 8,
              child: RawMaterialButton(
                onPressed: () {
                  //Navigator.pop(context);
                  print('share');
                },
                fillColor: Colors.white,
                shape: CircleBorder(),
                child: Icon(
                  Icons.share_outlined,
                  color: Colors.black54,
                ),
              )),
          Positioned(
              bottom: 8,
              left: 8,
              child: Row(
                children: [
                  for(String tag in model.tags)
                    Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Text(tag),
                    )
                ],
              )),
        ],
      ),
    );
  }
}
