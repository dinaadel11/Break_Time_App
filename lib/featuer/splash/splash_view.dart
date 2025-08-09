import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplasView extends StatelessWidget {
  const SplasView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashViewBody(),
    );
  }
}
