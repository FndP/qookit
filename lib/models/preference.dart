//
//  Preference.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';

part 'preference.g.dart';

@JsonSerializable()
class Preference {
  List<String> diet;
  List<String> recipe;
  String units;

  Preference({
    this.diet,
    this.recipe,
    this.units,
  });

  factory Preference.fromJson(Map<String, dynamic> json) => _$PreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceToJson(this);
}
