import 'package:flutter/material.dart';
import 'package:qookit/app/dimensions.dart';

class RecipeImage extends StatelessWidget {

  final String imageUrl;

  const RecipeImage(
      {Key key, this.imageUrl,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fixedUrl;

    if(imageUrl == null){
      fixedUrl = 'https://health.clevelandclinic.org/wp-content/uploads/sites/3/2019/06/cropped-GettyImages-643764514.jpg';
    }

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          height: Dimensions.recipeCardHeight,
          width: Dimensions.recipeCardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(fixedUrl),
            ),
          ),
        ),
        Positioned.fill(child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          height: Dimensions.recipeCardHeight,
          width: Dimensions.recipeCardWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
                Colors.transparent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
          ),
        ))
      ],
    );
  }
}
