import 'package:flutter/material.dart';

class BreakViewBody extends StatelessWidget {
  const BreakViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'it`s break time ',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Image.asset('assets/images/tut (1).png'),
        const SizedBox(
          height: 50,
        ),
        const Text(
          '09:59',
          style: TextStyle(
              fontSize: 70, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
