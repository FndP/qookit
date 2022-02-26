// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preference _$PreferenceFromJson(Map<String, dynamic> json) {
  return Preference(
    diet: (json['diet'] as List)?.map((e) => e as String)?.toList(),
    recipe: (json['recipe'] as List)?.map((e) => e as String)?.toList(),
    units: json['units'] as String,
  );
}

Map<String, dynamic> _$PreferenceToJson(Preference instance) =>
    <String, dynamic>{
      'diet': instance.diet,
      'recipe': instance.recipe,
      'units': instance.units,
    };
