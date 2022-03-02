import 'package:qookit/models/recipe.dart';
import 'package:qookit/services/elastic/endpoints/recipes_service.dart';
import 'package:qookit/services/services.dart';
import 'package:stacked/stacked.dart';

class RecipeSearchViewModel extends FutureViewModel<List<Recipe>> {
  String searchTerm;

  List<FilterGroup> categories = [
    FilterGroup('COURSES', [
      'Breakfast',
      'Soup',
      'Lunch',
      'Salad',
      'Appetizer',
      'Dessert',
      'Snack',
      'Sides'
    ]),
    FilterGroup('MAIN INGREDIENTS', [
      'Vegetables',
      'Beef',
      'Chicken',
      'Seafood',
      'Pasta',
      'Pork',
      'Grains',
      'Beans',
      'Pasta'
    ]),
    FilterGroup('CUISINE', [
      'Italian',
      'Chinese',
      'American',
      'Indian',
      'Mexican',
      'Middle Eastern',
    ]),
    FilterGroup('HEALTH ISSUES', [
      'Diabetic',
      'Overweight',
      'High Cholesterol',
      'High Blood Pressure',
      'Hypertension',
      'Anxiety',
    ]),
    FilterGroup('DIET', [
      'Vegetarian',
      'Paleo',
      'Vegan',
      'Low Calorie',
      'Keto',
      'Low/No Carb',
      'Low Fat',
      'Low/No Sugar',
      'Kosher',
      'Organic',
      'Low Sodium',
      'Low Cholesterol',
      'High Fiber'
    ]),
    FilterGroup('TOOLS OR TECHNIQUES', [
      'Oven',
      'No-Cook',
      'BBQ',
      'One-Pot',
      'Instant Pot',
      'Casserole',
      'Air-Fryer',
    ]),
    FilterGroup('POPULAR', [
      'Prepare Ahead',
      'Comfort-food',
      'Kid-friendly',
      'Easy',
      'Healthy',
      'Budget',
      'Game Day',
      'Happy Hour',
      'Special Occasion',
      'Most Popular'
    ]),
    /*'MAIN INGREDIENTS',
    'CUISINES',
    'HEALTH ISSUES',
    'ALLERGIES',
    'DIET',
    'TOOLS OR TECHNIQUE',
    'POPULAR',
    'CHEFS',*/
  ];

  @override
  Future<List<Recipe>> futureToRun() async {
    if (searchTerm != null) {
      return recipeService.getRecipeFromSearch(
        RecipeParameters(searchString: searchTerm),
      );
    } else {
      return await [];
    }
  }

  void initializeModel(String search) {
    searchTerm = search;
    notifyListeners();
  }
}

class FilterGroup {
  final String label;
  final List<String> filters;

  FilterGroup(this.label, this.filters);
}
