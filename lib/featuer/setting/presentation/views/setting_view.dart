import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/featuer/setting/presentation/manager/saver_data_cubit/saverdatacubit_cubit.dart';
import 'package:newsapp/featuer/setting/presentation/views/widget/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SaverdatacubitCubit()),
        ],
        child: SettingViewBody(),
      ),
    );
  }
}
