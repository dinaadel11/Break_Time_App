import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/featuer/setting/data/model/break_time_model.dart';

part 'saverdatacubit_state.dart';

class SaverdatacubitCubit extends Cubit<SaverdatacubitState> {
  SaverdatacubitCubit() : super(SaverdatacubitInitial());
  Future<void> saverData(BreakTimeModel breakmodel) async {
    try {
      emit(SaverdatacubitLoading());
      var box = await Hive.openBox<BreakTimeModel>(breakbox);
      await box.put("setting", breakmodel);
      emit(SaverdatacubitSuccess());
    } catch (e) {
      emit(SaverdatacubitFailuer(errMessage: e.toString()));
    }
  }

  Future<void> backupData() async {
    emit(SaverdatacubitLoading());
    try {
      final box = Hive.box<BreakTimeModel>(breakbox);
      await box.get("setting");
      emit(SaverdatacubitSuccess());
    } on Exception catch (e) {
      emit(SaverdatacubitFailuer(errMessage: e.toString()));
    }
  }
}
