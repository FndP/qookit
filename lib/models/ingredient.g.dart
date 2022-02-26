// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    ingredientId: json['ingredientId'] as String,
    name: json['name'] as String,
    prepNote: json['prepNote'] as String,
    quantity: json['quantity'] as int,
    text: json['text'] as String,
    unit: json['unit'] as String,
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'ingredientId': instance.ingredientId,
      'name': instance.name,
      'prepNote': instance.prepNote,
      'quantity': instance.quantity,
      'text': instance.text,
      'unit': instance.unit,
    };
