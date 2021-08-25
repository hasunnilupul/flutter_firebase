import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constants.dart';

class AppbarActionButton extends StatelessWidget {
  const AppbarActionButton({
    Key? key,
    this.icon,
    this.press,
    this.borderColor = primaryLightColor,
  }) : super(key: key);

  final Icon? icon;
  final Function()? press;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      margin: EdgeInsets.only(top: 9, right: 5, bottom: 9),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: GestureDetector(
        child: icon,
        onTap: press,
      ),
    );
  }
}
