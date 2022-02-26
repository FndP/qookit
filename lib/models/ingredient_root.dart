//
//  IngredientRoot.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';
import 'package:qookit/models/item.dart';

part 'ingredient_root.g.dart';

@JsonSerializable()
class IngredientRoot {
  String firstPageToken;
  int itemCount;
  List<Item> items;
  String lastPageToken;
  String nextPageToken;
  String prevPageToken;
  int totalItemCount;
  int totalPageCount;

  factory IngredientRoot.fromJson(Map<String, dynamic> json) => _$IngredientRootFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientRootToJson(this);

  IngredientRoot();
}