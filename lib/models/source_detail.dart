//
//  SourceDetail.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';

part 'source_detail.g.dart';

@JsonSerializable()
class SourceDetail {
  List<String> imageUrls;
  bool isActive;
  int likesCount;
  String modifiedDate;
  String publishedDate;
  int rating;
  int ratingCount;
  int reviewCount;
  String source;
  String url;
  String videoUrl;

  SourceDetail();

  factory SourceDetail.fromJson(Map<String, dynamic> json) => _$SourceDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SourceDetailToJson(this);
}