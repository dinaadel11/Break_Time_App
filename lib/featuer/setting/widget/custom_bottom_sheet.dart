import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';

import 'package:newsapp/core/utils/custom_button.dart';

class CustomBottomSheet {
  static Future<void> fetchDuration(
      BuildContext context, TextEditingController controller) async {
    int hours = 0;
    int minutes = 0;
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select Duration',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Hours',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<int>(
                          iconSize: 40,
                          value: hours,
                          items: List.generate(24, (i) => i)
                              .map((h) =>
                                  DropdownMenuItem(value: h, child: Text("$h")))
                              .toList(),
                          onChanged: (value) {
                            setModalState(() => hours = value ?? 0);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Minutes',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<int>(
                          iconSize: 40,
                          value: minutes,
                          items: List.generate(60, (i) => i)
                              .map((m) =>
                                  DropdownMenuItem(value: m, child: Text("$m")))
                              .toList(),
                          onChanged: (value) {
                            setModalState(() => minutes = value ?? 0);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.text =
                        "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kprimarycolor, // لون الخلفية
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // المسافة الداخلية
                  ),
                  child: const Text(
                    "Choose",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
