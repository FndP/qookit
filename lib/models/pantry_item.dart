//
//  PantryItem.dart
//  Model Generated using http://www.jsoncafe.com/
//  Created on December 19, 2020

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qookit/models/expiry_group.dart';

part 'pantry_item.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class PantryItem {
  @HiveField(0)
  String category;
  List<ExpiryGroup> expiryGroups;
  String ingredientId;
  @HiveField(1)
  bool isFrozen;
  @HiveField(2)
  bool isRefrigerated;
  @HiveField(3)
  String name;
  @HiveField(4)
  String notes;
  @HiveField(5)
  String photoUrl;

  factory PantryItem.fromJson(Map<String, dynamic> json) => _$PantryItemFromJson(json);

  Map<String, dynamic> toJson() => _$PantryItemToJson(this);

  PantryItem(
      {this.category,
      this.expiryGroups,
      this.ingredientId,
      this.isFrozen,
      this.isRefrigerated,
      this.name,
      this.notes,
      this.photoUrl});
}