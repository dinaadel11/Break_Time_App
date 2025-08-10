import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/utils/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Schedule is Off',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Center(
            child: Image.asset('assets/images/work (1).png'),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Next Break after',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              '59:09',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            textbutton: 'Start',
            onTap: () {
              GoRouter.of(context).push('/BreakView');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            textbutton: 'Edit',
            onTap: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
