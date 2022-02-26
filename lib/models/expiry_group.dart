//
//  ExpiryGroup.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expiry_group.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class ExpiryGroup {
  @HiveField(0)
  String createdDate;
  @HiveField(1)
  String expiresDate;
  @HiveField(2)
  String purchasedDate;
  @HiveField(3)
  int quantity;
  @HiveField(4)
  String unit;

  factory ExpiryGroup.fromJson(Map<String, dynamic> json) => _$ExpiryGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ExpiryGroupToJson(this);

  ExpiryGroup();
}