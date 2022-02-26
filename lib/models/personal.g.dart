// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personal _$PersonalFromJson(Map<String, dynamic> json) {
  return Personal(
    aboutMe: json['aboutMe'] as String,
    email: json['email'] as String,
    firstName: json['firstName'] as String,
    fullName: json['fullName'] as String,
    homeUrl: json['homeUrl'] as String,
    lastName: json['lastName'] as String,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PersonalToJson(Personal instance) => <String, dynamic>{
      'aboutMe': instance.aboutMe,
      'email': instance.email,
      'firstName': instance.firstName,
      'fullName': instance.fullName,
      'homeUrl': instance.homeUrl,
      'lastName': instance.lastName,
      'location': instance.location,
    };
