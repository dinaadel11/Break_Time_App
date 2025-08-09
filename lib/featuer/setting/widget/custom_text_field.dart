import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kprimarycolor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kprimarycolor),
          ),
        ),
      ),
    );
  }
}
