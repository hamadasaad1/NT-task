// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_destination.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TravelDestinationAdapter extends TypeAdapter<TravelDestination> {
  @override
  final int typeId = 3;

  @override
  TravelDestination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelDestination(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      imageUrl: fields[3] as String,
      createdBy: fields[4] as String,
      permissions: fields[5] as Permissions,
    );
  }

  @override
  void write(BinaryWriter writer, TravelDestination obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.permissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelDestinationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PermissionsAdapter extends TypeAdapter<Permissions> {
  @override
  final int typeId = 4;

  @override
  Permissions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Permissions(
      read: fields[0] as bool,
      write: fields[1] as bool,
      deleteItem: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Permissions obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.read)
      ..writeByte(1)
      ..write(obj.write)
      ..writeByte(2)
      ..write(obj.deleteItem);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PermissionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
