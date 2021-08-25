import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField(
      {Key? key,
      required this.controller,
      required this.onChanged,
      required this.validator,
      required this.saved})
      : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> saved;

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obsecureText = true;

  void toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            obscureText: _obsecureText,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Password',
              icon: Icon(
                Icons.lock,
                color: primaryColor,
              ),
              border: InputBorder.none,
            ),
            controller: widget.controller,
            onChanged: widget.onChanged,
            validator: widget.validator,
            onSaved: widget.saved,
          ),
          Positioned(
            right: -10,
            child: IconButton(
              icon: Icon(
                (_obsecureText ? Icons.visibility : Icons.visibility_off),
                color: primaryColor,
              ),
              splashColor: Colors.transparent,
              onPressed: () {
                toggle();
              },
            ),
          ),
        ],
      ),
    );
  }
}
