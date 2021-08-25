import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon(
      {Key? key,
      required this.iconSrc,
      this.iconColor = primaryColor,
      required this.press})
      : super(key: key);

  final String iconSrc;
  final Color iconColor;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: primaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          color: iconColor,
          height: 20,
          width: 20,
        ),
      ),
      onTap: press,
    );
  }
}
