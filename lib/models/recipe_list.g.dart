// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeList _$RecipeListFromJson(Map<String, dynamic> json) {
  return RecipeList()
    ..firstPageToken = json['firstPageToken'] as String
    ..itemCount = json['itemCount'] as int
    ..recipes = (json['items'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..lastPageToken = json['lastPageToken'] as String
    ..nextPageToken = json['nextPageToken'] as String
    ..prevPageToken = json['prevPageToken'] as String
    ..totalItemCount = json['totalItemCount'] as int
    ..totalPageCount = json['totalPageCount'] as int;
}

Map<String, dynamic> _$RecipeListToJson(RecipeList instance) =>
    <String, dynamic>{
      'firstPageToken': instance.firstPageToken,
      'itemCount': instance.itemCount,
      'items': instance.recipes,
      'lastPageToken': instance.lastPageToken,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'totalItemCount': instance.totalItemCount,
      'totalPageCount': instance.totalPageCount,
    };
