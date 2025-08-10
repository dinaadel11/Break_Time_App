import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.controller, required this.onTap});
  final TextEditingController controller;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLines: 1,
        readOnly: true,
        onTap: onTap,
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
