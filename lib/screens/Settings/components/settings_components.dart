import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/appbar_action_button.dart';
import 'package:flutter_firebase/components/appbar_leading_button.dart';
import 'package:flutter_firebase/interfaces/app_bar_component.dart';

import '../../../constants.dart';

class SettingsComponents implements AppBarComponent {
  @override
  List<Widget> getActions(User? user) {
    return [
      AppbarActionButton(
        icon: Icon(
          Icons.videocam_rounded,
          color: kLightGrey,
        ),
      ),
      AppbarActionButton(
        icon: Icon(
          Icons.call_rounded,
          color: kLightGrey,
        ),
      ),
    ];
  }

  @override
  Widget getLeadingIcon() {
    return AppBarLeadingButton(
      press: () {},
    );
  }

  @override
  Widget getTitle() {
    return Text(
      'Settings',
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: primaryDarkColor.withOpacity(.75),
      ),
    );
  }
}
