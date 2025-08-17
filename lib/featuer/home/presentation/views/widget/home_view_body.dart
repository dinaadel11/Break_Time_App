import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/core/utils/custom_button.dart';
import 'package:newsapp/featuer/home/presentation/views/widget/timer_view.dart';
import 'package:newsapp/featuer/setting/data/model/break_time_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<BreakTimeModel>(breakbox);

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, Box<BreakTimeModel> box, _) {
        var data = box.get("setting");
        if (data == null) {
          return const Center(child: Text("No settings found"));
        }

        return Padding(
          padding:
              const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My Schedule ',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.schedule,
                    size: 32,
                    color: Color.fromARGB(255, 54, 52, 134),
                  ),
                ],
              ),
              Center(child: Image.asset('assets/images/work (1).png')),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Next Break after',
                  style: TextStyle(fontSize: 26),
                ),
              ),
              const SizedBox(height: 20),
              Center(child: TimerView(totalseconds: data.frequancy * 60)),
              const SizedBox(height: 20),
              CustomButton(
                textbutton: 'Edit',
                onTap: () {
                  GoRouter.of(context).push('/SettingView');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
