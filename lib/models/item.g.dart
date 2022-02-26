// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item()
    ..icon = json['icon'] as String
    ..imageUrl = json['imageUrl'] as String
    ..name = json['name'] as String
    ..nutritionInfo = json['nutritionInfo'] == null
        ? null
        : NutritionInfo.fromJson(json['nutritionInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'icon': instance.icon,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'nutritionInfo': instance.nutritionInfo,
    };
