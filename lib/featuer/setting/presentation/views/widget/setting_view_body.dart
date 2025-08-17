import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/core/utils/custom_button.dart';
import 'package:newsapp/featuer/setting/data/model/break_time_model.dart';
import 'package:newsapp/featuer/setting/presentation/manager/saver_data_cubit/saverdatacubit_cubit.dart';

import 'package:newsapp/featuer/setting/presentation/views/widget/custom_text_field.dart';

class SettingViewBody extends StatefulWidget {
  SettingViewBody({
    super.key,
  });
  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  int? breakLength;

  int? frequancy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 15),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formkey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Set Up Break',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Schedule',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Break Length',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text(
            'How many minutes?',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          CustomTextField(
            onsaved: (value) {
              breakLength = int.tryParse(value ?? "0");
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Frequency',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Every few minutes?',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          CustomTextField(
            onsaved: (value) {
              frequancy = int.tryParse(value ?? "0");
            },
          ),
          const SizedBox(
            height: 250,
          ),
          BlocBuilder<SaverdatacubitCubit, SaverdatacubitState>(
            builder: (context, state) {
              return CustomButton(
                textbutton: 'Save',
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var box = Hive.box<BreakTimeModel>(breakbox);
                    var breakmodel = BreakTimeModel(
                        breakLenght: breakLength!,
                        frequancy: frequancy!,
                        nameButton: "start");
                    BlocProvider.of<SaverdatacubitCubit>(context)
                        .saverData(breakmodel);
                    GoRouter.of(context).push('/HomeView');
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
