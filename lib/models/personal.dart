//
//  Personal.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';
import 'package:qookit/models/location.dart';

part 'personal.g.dart';

@JsonSerializable()
class Personal {
  String aboutMe;
  String email;
  String firstName;
  String fullName;
  String homeUrl;
  String lastName;
  Location location;

  Personal({
    this.aboutMe,
    this.email,
    this.firstName,
    this.fullName,
    this.homeUrl,
    this.lastName,
    this.location,
  });

  factory Personal.fromJson(Map<String, dynamic> json) => _$PersonalFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalToJson(this);
}
