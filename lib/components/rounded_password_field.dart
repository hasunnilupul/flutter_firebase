import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: primaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: primaryColor,
            ),
            border: InputBorder.none,
          ),
          onChanged: onChanged,
        )
    );
  }
}
