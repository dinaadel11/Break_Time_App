import 'package:hive/hive.dart';

part 'break_time_model.g.dart';

@HiveType(typeId: 0)
class BreakTimeModel extends HiveObject {
  @HiveField(0)
  int breakLenght;
  @HiveField(1)
  int frequancy;
  @HiveField(2)
  String nameButton;

  BreakTimeModel(
      {required this.breakLenght,
      required this.frequancy,
      required this.nameButton});
  @override
  String toString() {
    return 'BreakTimeModel(breakLenght: $breakLenght, frequancy: $frequancy, nameButton: $nameButton)';
  }
}
