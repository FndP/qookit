import 'package:qookit/models/ingredient.dart';
import 'package:qookit/models/recipe.dart';
import 'package:stacked/stacked.dart';

class RecipeDetailsViewModel extends BaseViewModel {
  Recipe recipe;
  String selectedTab = 'ingredients';
  int servings = 6;

  //List<String> tags = ['KID FRIENDLY', 'KETO'];

  List<String> get tags {
    return recipe.dishTypes;
  }

  /// Get these from the recipe
  /// Todo calculate needed ingredients based on what's already in the user's pantry
  List<Ingredient> get neededIngredients {
    if (recipe.ingredients != null) {
      print('needed ingredients: '+ recipe.ingredients.toString());
      return recipe.ingredients;
    }
    // TODO remove demo data
    else {
      return [
        Ingredient(
          name: 'Basil',
          text: 'Several sprigs of fresh basil',
          quantity: 2,
          unit: 'cups',
        ),
        Ingredient(
          name: 'Olive Oil',
          text: 'extra-virgin olive oil',
          quantity: 1,
          unit: 'cup',
        ),
        Ingredient(
          name: 'Tomatoes',
          text: 'garlic cloves',
          quantity: 8,
          unit: 'oz',
        ),
      ];
    }
  }

  List<String> added = [];

  List<Ingredient> pantryIngredients = [
    Ingredient(
      name: 'Basil',
      text: 'Several sprigs of fresh basil',
      quantity: 2,
      unit: 'cups',
    ),
    Ingredient(name: 'Olive Oil', text: 'extra-virgin olive oil', quantity: 1, unit: 'cup'),
    Ingredient(name: 'Tomatoes', text: 'garlic cloves', quantity: 8, unit: 'oz'),
  ];

  List<String> get instructions {
    return recipe.instructions.map((e) => e.text).toList();
  }

  void initialize(Recipe thisRec) {
    added = [];
    recipe = thisRec;
    notifyListeners();
  }

  void updateTab(String newTab) {
    selectedTab = newTab;
    notifyListeners();
  }

  void toggleItem(Ingredient ing) {
    if (added.contains(ing.text)) {
      added.remove(ing.text);
    } else {
      added.add(ing.text);
    }
    notifyListeners();
  }

  void addAllNeeded(){
    print('adding all needed');
    neededIngredients.forEach((element) {
      if(!added.contains(element.text)){
        added.add(element.text);
      }
    });
    notifyListeners();
  }

  void addAllPantry(){
    print('adding all pantry');
    pantryIngredients.forEach((element) {
      if(!added.contains(element.text)){
        added.add(element.text);
      }
    });
    notifyListeners();
  }

  void changeServing(int val) {
    servings = servings + val;
    notifyListeners();
  }
}
