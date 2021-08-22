import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField(
      {Key? key,
        required this.hintText,
        required this.icon,
        required this.onChanged})
      : super(key: key);

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}