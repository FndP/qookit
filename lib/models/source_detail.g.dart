// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceDetail _$SourceDetailFromJson(Map<String, dynamic> json) {
  return SourceDetail()
    ..imageUrls = (json['imageUrls'] as List)?.map((e) => e as String)?.toList()
    ..isActive = json['isActive'] as bool
    ..likesCount = json['likesCount'] as int
    ..modifiedDate = json['modifiedDate'] as String
    ..publishedDate = json['publishedDate'] as String
    ..rating = json['rating'] as int
    ..ratingCount = json['ratingCount'] as int
    ..reviewCount = json['reviewCount'] as int
    ..source = json['source'] as String
    ..url = json['url'] as String
    ..videoUrl = json['videoUrl'] as String;
}

Map<String, dynamic> _$SourceDetailToJson(SourceDetail instance) =>
    <String, dynamic>{
      'imageUrls': instance.imageUrls,
      'isActive': instance.isActive,
      'likesCount': instance.likesCount,
      'modifiedDate': instance.modifiedDate,
      'publishedDate': instance.publishedDate,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'reviewCount': instance.reviewCount,
      'source': instance.source,
      'url': instance.url,
      'videoUrl': instance.videoUrl,
    };
