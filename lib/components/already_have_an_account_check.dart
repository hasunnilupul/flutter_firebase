import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  const AlreadyHaveAnAccountCheck({Key? key, this.login = true, required this.press}) : super(key: key);

  final bool login;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ? ",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        GestureDetector(
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold
            ),
          ),
          onTap: press,
        )
      ],
    );
  }
}