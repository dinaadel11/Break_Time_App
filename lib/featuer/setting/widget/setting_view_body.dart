import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/utils/custom_button.dart';
import 'package:newsapp/featuer/setting/widget/custom_text_field.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const CustomTextField(),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Frequency',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const CustomTextField(),
          const SizedBox(
            height: 250,
          ),
          CustomButton(
            textbutton: 'Save',
            onTap: () {
              GoRouter.of(context).push('/HomeView');
            },
          ),
        ],
      ),
    );
  }
}
