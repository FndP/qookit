//
//  NutritionInfo.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';

part 'nutrition_info.g.dart';

@JsonSerializable()
class NutritionInfo {
  int caloriesFromFat;
  int cholesterol;
  int cholesterolPct;
  int dietaryFiber;
  int dietaryFiberPct;
  List<String> dietLabels;
  List<String> healthLabels;
  int monoFat;
  int polyFat;
  int potassium;
  int potassiumPct;
  int protein;
  int proteinPct;
  String singularYieldUnit;
  int sodium;
  int sodiumPct;
  int sugar;
  int totalCalories;
  int totalCarbs;
  int totalCarbsPct;
  int totalFat;
  int totalFatPct;
  int transFat;

  factory NutritionInfo.fromJson(Map<String, dynamic> json) => _$NutritionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionInfoToJson(this);

  NutritionInfo();
}