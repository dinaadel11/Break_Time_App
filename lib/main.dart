import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/constant.dart';

import 'package:newsapp/core/utils/app_router.dart';
import 'package:newsapp/featuer/setting/data/model/break_time_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BreakTimeModelAdapter());
  await Hive.openBox<BreakTimeModel>(breakbox);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const BreakTimeApp(), // Wrap your app
    ),
  );
}

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
