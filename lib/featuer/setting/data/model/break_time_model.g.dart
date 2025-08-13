part of 'break_time_model.dart';

class BreakTimeModelAdapter extends TypeAdapter<BreakTimeModel> {
  @override
  final int typeId = 0;

  @override
  BreakTimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreakTimeModel(
      breakLenght: fields[0] as int,
      frequancy: fields[1] as int,
      nameButton: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BreakTimeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.breakLenght)
      ..writeByte(1)
      ..write(obj.frequancy)
      ..writeByte(2)
      ..write(obj.nameButton);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreakTimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
