import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:newsapp/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onsaved});
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: onsaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'this Field is requied';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        maxLines: 1,
        onTap: () {},
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
