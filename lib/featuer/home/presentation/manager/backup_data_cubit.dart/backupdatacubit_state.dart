part of 'backupdatacubit_cubit.dart';

@immutable
abstract class BackupdatacubitState {}

class BackupdatacubitInitial extends BackupdatacubitState {}

class BackupdatacubitLoading extends BackupdatacubitState {}

class BackupdatacubitSuccess extends BackupdatacubitState {
  List<BreakTimeModel> data;
  BackupdatacubitSuccess({required this.data});
}

class BackupdatacubitFaliuer extends BackupdatacubitState {
  final String errMessage;

  BackupdatacubitFaliuer({required this.errMessage});
}
