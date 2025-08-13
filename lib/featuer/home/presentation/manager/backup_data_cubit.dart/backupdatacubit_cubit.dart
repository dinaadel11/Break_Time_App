import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/featuer/setting/data/model/break_time_model.dart';

part 'backupdatacubit_state.dart';

class BackupdatacubitCubit extends Cubit<BackupdatacubitState> {
  BackupdatacubitCubit() : super(BackupdatacubitInitial());
  Future<void> backUpData() async {
    emit(BackupdatacubitLoading());
    try {
      final box = Hive.box<BreakTimeModel>(breakbox);
      final data = box.get("setting") as List<BreakTimeModel>;
      emit(BackupdatacubitSuccess(data: data));
    } catch (e) {
      emit(BackupdatacubitFaliuer(errMessage: e.toString()));
    }
  }
}
