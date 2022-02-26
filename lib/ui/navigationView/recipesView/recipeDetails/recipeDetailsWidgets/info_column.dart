import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qookit/models/ingredient.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipe_details_view_model.dart';
import 'package:stacked/stacked.dart';

class InfoColumn extends ViewModelWidget<RecipeDetailsViewModel> {
  @override
  Widget build(BuildContext context, RecipeDetailsViewModel model) {
    if (model.selectedTab == 'ingredients') {
      return Column(
        children: [
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart_outlined),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ITEMS YOU NEED',
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
            trailing: TextButton(
              child: Text(
                'SELECT ALL',
                style: GoogleFonts.openSans(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              onPressed: () {
                model.addAllNeeded();
              },
            ),
          ),
          for (Ingredient ing in model.neededIngredients)
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ing.quantity ?? '', style: GoogleFonts.openSans(fontSize: 15)),
                  Text(ing.unit ?? '', style: GoogleFonts.openSans(fontSize: 15)),
                ],
              ),
              onTap: () {
                model.toggleItem(ing);
              },
              title: Text(
                ing.text,
                style: GoogleFonts.openSans(fontSize: 15),
              ),
              trailing: IconButton(
                onPressed: () {
                  model.toggleItem(ing);
                },
                icon: !model.added.contains(ing.text)
                    ? SvgPicture.asset('assets/images/circle_checkbox_empty.svg')
                    : SvgPicture.asset('assets/images/circle_checkbox_checked.svg'),
              ),
            ),
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.fastfood_outlined),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'IN YOUR PANTRY',
                    style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            trailing: TextButton(
              child: Text(
                'RESTOCK ALL',
                style: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.black),
              ),
              onPressed: () {
                model.addAllPantry();
              },
            ),
          ),
          for (Ingredient ing in model.pantryIngredients)
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(ing.quantity.toString(),
                    style: GoogleFonts.openSans(
                        fontSize: 15
                    )), Text(ing.unit,
                    style: GoogleFonts.openSans(
                        fontSize: 15
                    ))],
              ),
              onTap: () {
                model.toggleItem(ing);
              },
              title: Text(ing.text,
                  style: GoogleFonts.openSans(
                      fontSize: 15
                  )),
              trailing: IconButton(
                onPressed: () {
                  model.toggleItem(ing);
                },
                icon: !model.added.contains(ing.text)
                    ? SvgPicture.asset('assets/images/circle_checkbox_empty.svg')
                    : SvgPicture.asset('assets/images/circle_checkbox_checked.svg'),
              ),
            ),
        ],
      );
    } else {
      return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Column(
              children: [
                Text(
                  index.toString(),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                ),
              ],
            ),
            title: Text(model.instructions[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: model.instructions.length,
      );
    }
  }
}
