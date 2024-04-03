// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proctor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProctorModelAdapter extends TypeAdapter<ProctorModel> {
  @override
  final int typeId = 0;

  @override
  ProctorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProctorModel(
      fields[0] as String,
      (fields[3] as Map).cast<String, dynamic>(),
      (fields[2] as Map).cast<String, dynamic>(),
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProctorModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.audio)
      ..writeByte(3)
      ..write(obj.object);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProctorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
