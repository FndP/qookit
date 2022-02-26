import 'package:qookit/models/recipe.dart';
import 'package:qookit/services/services.dart';
import 'package:stacked/stacked.dart';

class FavoritesViewModel extends FutureViewModel<List<Recipe>> {
  @override
  Future<List<Recipe>> futureToRun() => recipeService.getSuggestedRecipes();

  // TODO: get user favorites
  Future<List<Recipe>> getUserRecipes() async {
    List<Recipe> myRecipes = await usersService.getUserRecipes('18c85fa7-e850-44b0-8c33-2d46beb69b59');
    print('my future recipes: ' + myRecipes.toString());
    return myRecipes ?? [];
  }


  @override
  void onError(error) {
    print('recipes error: '+ error.toString());
    super.onError(error);
  }
}