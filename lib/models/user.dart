//
//  UserRoot.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:json_annotation/json_annotation.dart';
import 'package:qookit/models/personal.dart';
import 'package:qookit/models/preference.dart';
import 'package:qookit/models/recipe.dart';

part 'user.g.dart';

@JsonSerializable()
class UserRoot {
  String backgroundUrl;
  String displayName;
  String id;
  List<String> pantryItems;
  Personal personal;
  String photoUrl;
  Preference preferences;
  List<Recipe> recipes;
  String userName;

  UserRoot({
    this.backgroundUrl,
    this.displayName,
    this.id,
    this.pantryItems,
    this.personal,
    this.photoUrl,
    this.preferences,
    this.recipes,
    this.userName,
  });

  factory UserRoot.fromJson(Map<String, dynamic> json) => _$UserRootFromJson(json);

  Map<String, dynamic> toJson() => _$UserRootToJson(this);
}
