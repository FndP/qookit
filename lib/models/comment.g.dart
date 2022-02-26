// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment()
    ..createdDate = json['createdDate'] as String
    ..modifiedDate = json['modifiedDate'] as String
    ..name = json['name'] as String
    ..rating = json['rating'] as String
    ..text = json['text'] as String
    ..userId = json['userId'] as String;
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'name': instance.name,
      'rating': instance.rating,
      'text': instance.text,
      'userId': instance.userId,
    };
