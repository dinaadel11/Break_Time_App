import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/featuer/setting/data/model/break_time_model.dart';

part 'backupdatacubit_state.dart';

class BackupdatacubitCubit extends Cubit<BackupdatacubitState> {
  BackupdatacubitCubit() : super(BackupdatacubitInitial());
  BreakTimeModel? data;
  Future<void> backUpData() async {
    emit(BackupdatacubitLoading());
    try {
      final box = Hive.box<BreakTimeModel>(breakbox);
      final data = box.get("setting");
      if (data != null) {
        emit(BackupdatacubitSuccess(data: data as BreakTimeModel));
      } else {
        emit(BackupdatacubitFaliuer(errMessage: "no data found"));
      }
    } catch (e) {
      emit(BackupdatacubitFaliuer(errMessage: e.toString()));
    }
  }

  // Future<void> updatemodel(BreakTimeModel model) async {
  //   emit(BackupdatacubitLoading());
  //   try {
  //     var box = Hive.box<BreakTimeModel>(breakbox);
  //     await box.put("setting", model);
  //     emit(BackupdatacubitSuccess(data: model));
  //   } catch (e) {
  //     emit(BackupdatacubitFaliuer(errMessage: e.toString()));
  //   }
  // }
}
