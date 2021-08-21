import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
        required this.text,
        required this.press,
        this.color = primaryColor,
        this.textColor = Colors.white})
      : super(key: key);

  final String text;
  final Function() press;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
          onPressed: press,
          style: TextButton.styleFrom(
              backgroundColor: color,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)
          ),
        ),
      ),
    );
  }
}