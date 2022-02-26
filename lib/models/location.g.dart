// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    city: json['city'] as String,
    country: json['country'] as String,
    gps: json['gps'] as String,
    ipAddr: json['ip_addr'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'gps': instance.gps,
      'ip_addr': instance.ipAddr,
      'state': instance.state,
      'zip': instance.zip,
    };
