import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:newsapp/core/utils/app_router.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const BreakTimeApp(), // Wrap your app
      ),
    );

class BreakTimeApp extends StatelessWidget {
  const BreakTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
/*
controller.text =
   "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
     Navigator.pop(context);
*/