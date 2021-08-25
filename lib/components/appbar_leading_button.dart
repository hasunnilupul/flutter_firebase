import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarLeadingButton extends StatelessWidget {
  const AppBarLeadingButton({
    Key? key,
    this.icon = Icons.arrow_back_ios_rounded,
    this.press,
  }) : super(key: key);

  final IconData icon;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      margin: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: primaryLightColor.withOpacity(0.2),
      ),
      child: GestureDetector(
        child: Icon(
          icon,
          color: kLightGrey,
        ),
        onTap: press,
      ),
    );
  }
}
