// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiry_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpiryGroupAdapter extends TypeAdapter<ExpiryGroup> {
  @override
  final int typeId = 2;

  @override
  ExpiryGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpiryGroup()
      ..createdDate = fields[0] as String
      ..expiresDate = fields[1] as String
      ..purchasedDate = fields[2] as String
      ..quantity = fields[3] as int
      ..unit = fields[4] as String;
  }
  @override
  void write(BinaryWriter writer, ExpiryGroup obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.createdDate)
      ..writeByte(1)
      ..write(obj.expiresDate)
      ..writeByte(2)
      ..write(obj.purchasedDate)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpiryGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpiryGroup _$ExpiryGroupFromJson(Map<String, dynamic> json) {
  return ExpiryGroup()
    ..createdDate = json['createdDate'] as String
    ..expiresDate = json['expiresDate'] as String
    ..purchasedDate = json['purchasedDate'] as String
    ..quantity = json['quantity'] as int
    ..unit = json['unit'] as String;
}

Map<String, dynamic> _$ExpiryGroupToJson(ExpiryGroup instance) =>
    <String, dynamic>{
      'createdDate': instance.createdDate,
      'expiresDate': instance.expiresDate,
      'purchasedDate': instance.purchasedDate,
      'quantity': instance.quantity,
      'unit': instance.unit,
    };
