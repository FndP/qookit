// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoot _$UserRootFromJson(Map<String, dynamic> json) {
  return UserRoot(
    backgroundUrl: json['backgroundUrl'] as String,
    displayName: json['displayName'] as String,
    id: json['id'] as String,
    pantryItems:
        (json['pantryItems'] as List)?.map((e) => e as String)?.toList(),
    personal: json['personal'] == null
        ? null
        : Personal.fromJson(json['personal'] as Map<String, dynamic>),
    photoUrl: json['photoUrl'] as String,
    preferences: json['preferences'] == null
        ? null
        : Preference.fromJson(json['preferences'] as Map<String, dynamic>),
    recipes: (json['recipes'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userName: json['userName'] as String,
  );
}

Map<String, dynamic> _$UserRootToJson(UserRoot instance) => <String, dynamic>{
      'backgroundUrl': instance.backgroundUrl,
      'displayName': instance.displayName,
      'id': instance.id,
      'pantryItems': instance.pantryItems,
      'personal': instance.personal,
      'photoUrl': instance.photoUrl,
      'preferences': instance.preferences,
      'recipes': instance.recipes,
      'userName': instance.userName,
    };
