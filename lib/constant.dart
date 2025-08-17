import 'package:flutter/material.dart';

const Color kprimarycolor = Color(0xff3d73df);
const breakbox = 'breakTimeBox';

class AppGradiant {
  static const LinearGradient Kcolors = LinearGradient(
    colors: [
      Color.fromARGB(255, 152, 255, 155),
      Colors.red,
      Colors.yellow,
      Colors.blue
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
