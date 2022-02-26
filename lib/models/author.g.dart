// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author()
    ..extUserId = json['extUserId'] as String
    ..fullName = json['fullName'] as String
    ..userId = json['userId'] as String;
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'extUserId': instance.extUserId,
      'fullName': instance.fullName,
      'userId': instance.userId,
    };
