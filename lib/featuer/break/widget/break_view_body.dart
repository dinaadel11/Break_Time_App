import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/featuer/break/widget/timer_view_breaks.dart';
import 'package:newsapp/featuer/home/presentation/manager/backup_data_cubit.dart/backupdatacubit_cubit.dart';

class BreakViewBody extends StatefulWidget {
  const BreakViewBody({super.key});

  @override
  State<BreakViewBody> createState() => _BreakViewBodyState();
}

class _BreakViewBodyState extends State<BreakViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackupdatacubitCubit, BackupdatacubitState>(
      builder: (context, state) {
        if (state is BackupdatacubitFaliuer) {
          return const Text('Opss There an Error');
        }
        if (state is BackupdatacubitSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'its a break time',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppGradiant.Kcolors.createShader(bounds),
                    child: const Icon(
                      Icons.celebration,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/tut (1).png'),
              const SizedBox(
                height: 50,
              ),
              TimerViewBreaks(
                totalseconds: state.data.breakLenght * 60,
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
