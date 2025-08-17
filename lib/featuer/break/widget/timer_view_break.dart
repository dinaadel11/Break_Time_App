import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerViewBreak extends StatefulWidget {
  TimerViewBreak({super.key, required this.totalseconds});
  int totalseconds;

  @override
  State<TimerViewBreak> createState() => _TimerViewBreakState();
}

class _TimerViewBreakState extends State<TimerViewBreak> {
  late int remaining;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    remaining = widget.totalseconds;
    setBreak();
  }

  void setBreak() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (remaining > 0) {
        setState(() {
          remaining--;
        });
      } else {
        t.cancel();
        GoRouter.of(context).push('/SettingView');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = remaining ~/ 60;
    int seconds = remaining % 60;
    return Text('${minutes}:${seconds.toString().padLeft(2, '0')}');
  }
}
