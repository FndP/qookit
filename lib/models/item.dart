//
//  Item.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';
import 'package:qookit/models/nutrition_info.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String icon;
  String imageUrl;
  String name;
  NutritionInfo nutritionInfo;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  Item();
}