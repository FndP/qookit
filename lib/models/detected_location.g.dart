// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectedLocation _$DetectedLocationFromJson(Map<String, dynamic> json) {
  return DetectedLocation(
    bottom: (json['bottom'] as num)?.toDouble(),
    left: (json['left'] as num)?.toDouble(),
    right: (json['right'] as num)?.toDouble(),
    top: (json['top'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DetectedLocationToJson(DetectedLocation instance) =>
    <String, dynamic>{
      'bottom': instance.bottom,
      'left': instance.left,
      'right': instance.right,
      'top': instance.top,
    };
