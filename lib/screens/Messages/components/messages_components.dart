import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/appbar_leading_button.dart';
import 'package:flutter_firebase/components/user_image.dart';
import 'package:flutter_firebase/interfaces/app_bar_component.dart';

import '../../../constants.dart';

class MessagesComponents implements AppBarComponent {
  Widget getTitle() {
    return Text(
      'Messages',
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: primaryDarkColor.withOpacity(.75),
      ),
    );
  }

  Widget getLeadingIcon() {
    return AppBarLeadingButton(
      icon: Icons.search_rounded,
      press: () {},
    );
  }

  List<Widget> getActions(User? user) {
    return [
      UserImage(
        user: user,
      ),
    ];
  }
}
