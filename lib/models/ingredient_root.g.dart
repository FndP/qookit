// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_root.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientRoot _$IngredientRootFromJson(Map<String, dynamic> json) {
  return IngredientRoot()
    ..firstPageToken = json['firstPageToken'] as String
    ..itemCount = json['itemCount'] as int
    ..items = (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..lastPageToken = json['lastPageToken'] as String
    ..nextPageToken = json['nextPageToken'] as String
    ..prevPageToken = json['prevPageToken'] as String
    ..totalItemCount = json['totalItemCount'] as int
    ..totalPageCount = json['totalPageCount'] as int;
}

Map<String, dynamic> _$IngredientRootToJson(IngredientRoot instance) =>
    <String, dynamic>{
      'firstPageToken': instance.firstPageToken,
      'itemCount': instance.itemCount,
      'items': instance.items,
      'lastPageToken': instance.lastPageToken,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'totalItemCount': instance.totalItemCount,
      'totalPageCount': instance.totalPageCount,
    };
