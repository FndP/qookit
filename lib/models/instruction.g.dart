// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instruction _$InstructionFromJson(Map<String, dynamic> json) {
  return Instruction()
    ..imageUrl = json['imageUrl'] as String
    ..text = json['text'] as String;
}

Map<String, dynamic> _$InstructionToJson(Instruction instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'text': instance.text,
    };
