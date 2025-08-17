import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerViewBreaks extends StatelessWidget {
  const TimerViewBreaks({super.key, required this.totalseconds});
  final int totalseconds;

  @override
  Widget build(BuildContext context) {
    final CountDownController _controller = CountDownController();

    return Center(
      child: CircularCountDownTimer(
        width: 200,
        height: 200,
        duration: totalseconds,
        initialDuration: 0,
        controller: _controller,
        fillColor: const Color.fromARGB(255, 91, 181, 255),
        ringColor: Colors.green,
        strokeWidth: 20,
        strokeCap: StrokeCap.round,
        isReverse: true,
        isReverseAnimation: true,
        autoStart: true,
        textFormat: CountdownTextFormat.HH_MM_SS,
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        onComplete: () {
          GoRouter.of(context).push('/HomeView');
        },
      ),
    );
  }
}
