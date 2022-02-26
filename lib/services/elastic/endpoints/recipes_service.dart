import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:qookit/models/recipe.dart';
import 'package:qookit/models/recipe_list.dart';
import 'package:qookit/services/services.dart';

// Class to managa all recipe-related requests and search results
@singleton
class RecipesService {
  static const String endpoint = '/v1/recipes';

  List<Recipe> searchRecipes = [];
  List<Recipe> suggestedRecipes = [];
  List<Recipe> seasonalRecipes = [];
  List<Recipe> dietRecipes = [];

  Future<List<Recipe>> getRecipeFromSearch(
      RecipeParameters recipeParameters) async {
    searchRecipes = [];
    var uri =
        Uri.https(elasticService.domain, endpoint, recipeParameters.toMap());
    var token = await authService.token;
    print("token = " + token);
    var recipeResponse = await http.get(
      uri,
      headers: {
        //HttpHeaders.authorizationHeader
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    RecipeList recipeList =
        RecipeList.fromJson(jsonDecode(recipeResponse.body));
    //assert(recipeList.recipes.first == recipeList.recipes);
    //print(recipeList.recipes);
    //Recipe testRecipe = recipeList.recipes.first;
    //Recipe testRecipe = Recipe.fromJSON(recipeList.recipes.first);
    //print('recipes type: '+  testRecipe.title);
    //print('recipes: '+  jsonDecode(recipeList.recipes.first.toString()));

    // Add the results to the searchResults list
    recipeList.recipes.forEach((recipe) {
      print('adding recipe');
      searchRecipes.add(recipe);
    });

    print(searchRecipes.toString());
    print('Response status: ${recipeResponse.statusCode}');
    print('Response body: ${recipeResponse.body}');
    print('Response recipe: ${recipeList.recipes.first}');

    return searchRecipes;
  }

  Future<List<Recipe>> getSuggestedRecipes(
      {RecipeParameters recipeParameters}) async {
    RecipeParameters queryParameters;
    if (recipeParameters == null) {
      queryParameters = RecipeParameters(searchString: 'beef');
    } else {
      queryParameters = recipeParameters;
    }

    suggestedRecipes = [];
    var uri =
        Uri.https(elasticService.domain, endpoint, queryParameters.toMap());
    var token = await authService.token;

    var recipeResponse = await http.get(
      uri,
      headers: {
        //HttpHeaders.authorizationHeader
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    RecipeList recipeList =
        RecipeList.fromJson(jsonDecode(recipeResponse.body));

    // Add the results to the searchResults list
    recipeList.recipes.forEach((recipe) {
      print('adding recipe');
      suggestedRecipes.add(recipe);
    });

    print(suggestedRecipes.toString());
    print('Response status: ${recipeResponse.statusCode}');
    print('Response body: ${recipeResponse.body}');
    print('Response recipe: ${recipeList.recipes.first}');

    return suggestedRecipes;
  }
}

class RecipeParameters {
  final String searchString;
  final String dishName;
  final List<String> cuisine;
  final List<String> dishTypes;
  final List<String> cookMethod;
  final int maxTotalTime;
  final int minRating;
  final int maxTotalCalories;
  final List<String> dietLabels;
  final int pageSize;
  final String pageToken;
  final String include;

  RecipeParameters({
    this.searchString,
    this.dishName,
    this.cuisine,
    this.dishTypes,
    this.cookMethod,
    this.maxTotalTime,
    this.minRating,
    this.maxTotalCalories,
    this.dietLabels,
    this.pageSize,
    this.pageToken,
    this.include,
  });

  Map<String, String> toMap() {
    return {
      if (searchString != null) 'searchString': searchString.toString(),
      if (dishName != null) 'dishName': dishName.toString(),
      if (cuisine != null) 'cuisine': cuisine.toString(),
      if (dishTypes != null) 'dishTypes': dishTypes.toString(),
      if (cookMethod != null) 'cookMethod': cookMethod.toString(),
      if (maxTotalTime != null) 'maxTotalTime': maxTotalTime.toString(),
      if (minRating != null) 'minRating': minRating.toString(),
      if (maxTotalCalories != null)
        'maxTotalCalories': maxTotalCalories.toString(),
      if (dietLabels != null) 'dietLabels': dietLabels.toString(),
      if (pageSize != null) 'pageSize': pageSize.toString(),
      if (pageToken != null) 'pageToken': pageToken.toString(),
      if (include != null) 'include': include.toString()
    };
  }
}
