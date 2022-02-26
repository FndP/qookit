// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PantryItemAdapter extends TypeAdapter<PantryItem> {
  @override
  final int typeId = 1;

  @override
  PantryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PantryItem(
      category: fields[0] as String,
      isFrozen: fields[1] as bool,
      isRefrigerated: fields[2] as bool,
      name: fields[3] as String,
      notes: fields[4] as String,
      photoUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PantryItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.isFrozen)
      ..writeByte(2)
      ..write(obj.isRefrigerated)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PantryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PantryItem _$PantryItemFromJson(Map<String, dynamic> json) {
  return PantryItem(
    category: json['category'] as String,
    expiryGroups: (json['expiryGroups'] as List)
        ?.map((e) =>
            e == null ? null : ExpiryGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ingredientId: json['ingredientId'] as String,
    isFrozen: json['isFrozen'] as bool,
    isRefrigerated: json['isRefrigerated'] as bool,
    name: json['name'] as String,
    notes: json['notes'] as String,
    photoUrl: json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$PantryItemToJson(PantryItem instance) =>
    <String, dynamic>{
      'category': instance.category,
      'expiryGroups': instance.expiryGroups,
      'ingredientId': instance.ingredientId,
      'isFrozen': instance.isFrozen,
      'isRefrigerated': instance.isRefrigerated,
      'name': instance.name,
      'notes': instance.notes,
      'photoUrl': instance.photoUrl,
    };
