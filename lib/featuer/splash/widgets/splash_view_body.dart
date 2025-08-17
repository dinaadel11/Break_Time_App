import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/custom_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 60,
        ),
        Center(child: Image.asset('assets/images/breaktime.png')),
        const SizedBox(
          height: 60,
        ),
        const Text(
          'Welcome to',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Break Time!',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 200,
        ),
        CustomButton(
          textbutton: 'Get Statred',
          onTap: () {
            GoRouter.of(context).push('/SettingView');
          },
        ),
      ],
    );
  }
}
