// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectedObject _$DetectedObjectFromJson(Map<String, dynamic> json) {
  return DetectedObject(
    confidence: (json['confidence'] as num)?.toDouble(),
    detectedClass: json['detectedClass'] as int,
    id: json['id'] as String,
    location: json['location'] == null
        ? null
        : DetectedLocation.fromJson(json['location'] as Map<String, dynamic>),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$DetectedObjectToJson(DetectedObject instance) =>
    <String, dynamic>{
      'confidence': instance.confidence,
      'detectedClass': instance.detectedClass,
      'id': instance.id,
      'location': instance.location,
      'title': instance.title,
    };
