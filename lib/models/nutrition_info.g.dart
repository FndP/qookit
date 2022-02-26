// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionInfo _$NutritionInfoFromJson(Map<String, dynamic> json) {
  return NutritionInfo()
    ..caloriesFromFat = json['caloriesFromFat'] as int
    ..cholesterol = json['cholesterol'] as int
    ..cholesterolPct = json['cholesterolPct'] as int
    ..dietaryFiber = json['dietaryFiber'] as int
    ..dietaryFiberPct = json['dietaryFiberPct'] as int
    ..dietLabels =
        (json['dietLabels'] as List)?.map((e) => e as String)?.toList()
    ..healthLabels =
        (json['healthLabels'] as List)?.map((e) => e as String)?.toList()
    ..monoFat = json['monoFat'] as int
    ..polyFat = json['polyFat'] as int
    ..potassium = json['potassium'] as int
    ..potassiumPct = json['potassiumPct'] as int
    ..protein = json['protein'] as int
    ..proteinPct = json['proteinPct'] as int
    ..singularYieldUnit = json['singularYieldUnit'] as String
    ..sodium = json['sodium'] as int
    ..sodiumPct = json['sodiumPct'] as int
    ..sugar = json['sugar'] as int
    ..totalCalories = json['totalCalories'] as int
    ..totalCarbs = json['totalCarbs'] as int
    ..totalCarbsPct = json['totalCarbsPct'] as int
    ..totalFat = json['totalFat'] as int
    ..totalFatPct = json['totalFatPct'] as int
    ..transFat = json['transFat'] as int;
}

Map<String, dynamic> _$NutritionInfoToJson(NutritionInfo instance) =>
    <String, dynamic>{
      'caloriesFromFat': instance.caloriesFromFat,
      'cholesterol': instance.cholesterol,
      'cholesterolPct': instance.cholesterolPct,
      'dietaryFiber': instance.dietaryFiber,
      'dietaryFiberPct': instance.dietaryFiberPct,
      'dietLabels': instance.dietLabels,
      'healthLabels': instance.healthLabels,
      'monoFat': instance.monoFat,
      'polyFat': instance.polyFat,
      'potassium': instance.potassium,
      'potassiumPct': instance.potassiumPct,
      'protein': instance.protein,
      'proteinPct': instance.proteinPct,
      'singularYieldUnit': instance.singularYieldUnit,
      'sodium': instance.sodium,
      'sodiumPct': instance.sodiumPct,
      'sugar': instance.sugar,
      'totalCalories': instance.totalCalories,
      'totalCarbs': instance.totalCarbs,
      'totalCarbsPct': instance.totalCarbsPct,
      'totalFat': instance.totalFat,
      'totalFatPct': instance.totalFatPct,
      'transFat': instance.transFat,
    };
