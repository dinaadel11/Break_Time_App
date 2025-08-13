part of 'saverdatacubit_cubit.dart';

@immutable
abstract class SaverdatacubitState {}

class SaverdatacubitInitial extends SaverdatacubitState {}

class SaverdatacubitLoading extends SaverdatacubitState {}

class SaverdatacubitSuccess extends SaverdatacubitState {}

class SaverdatacubitFailuer extends SaverdatacubitState {
  final String errMessage;

  SaverdatacubitFailuer({required this.errMessage});
}
