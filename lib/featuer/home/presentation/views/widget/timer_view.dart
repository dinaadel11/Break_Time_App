import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/utils/custom_button.dart';

class TimerView extends StatefulWidget {
  TimerView({super.key, required this.totalseconds});
  int totalseconds;

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  late int remainingseconds;
  Timer? timer;
  bool isRunning = false;
  @override
  void initState() {
    super.initState();
    remainingseconds = widget.totalseconds;
  }

  void startAndStopTimer() {
    if (isRunning) {
      timer?.cancel();
      setState(() {
        isRunning = false;
      });
    } else {
      setState(() {
        isRunning = true;
      });
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (t) {
          if (!mounted) {
            t.cancel();
            return;
          }
          if (remainingseconds > 0) {
            setState(() {
              remainingseconds--;
            });
          } else {
            t.cancel();
            setState(() {
              isRunning = false;
            });
            if (mounted) {
              Fluttertoast.showToast(
                msg: "Your break time has started!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 20,
              );
              GoRouter.of(context).push('/BreakView');
            }
          }
        },
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = remainingseconds ~/ 60;
    int seconds = remainingseconds % 60;
    return Column(
      children: [
        Text(
          '${minutes}:${seconds.toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          onTap: () {
            startAndStopTimer();
          },
          textbutton: (isRunning ? "Stop" : "Start"),
        ),
      ],
    );
  }
}
