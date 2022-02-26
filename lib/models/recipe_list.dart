//
//  RecipeList.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';
import 'package:qookit/models/recipe.dart';

part 'recipe_list.g.dart';

@JsonSerializable()
class RecipeList {
  String firstPageToken;
  int itemCount;
  @JsonKey(name: 'items')
  List<Recipe> recipes;
  String lastPageToken;
  String nextPageToken;
  String prevPageToken;
  int totalItemCount;
  int totalPageCount;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory RecipeList.fromJson(Map<String, dynamic> json) {
    print('generating list');
    try {
      print('internal: ' + _$RecipeListFromJson(json).toJson().toString());
      return _$RecipeListFromJson(json);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RecipeListToJson(this);

  RecipeList();
}

