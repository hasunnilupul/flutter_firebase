import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AppBarComponent {
  Widget getTitle();
  Widget getLeadingIcon();
  List<Widget> getActions(User? user);
}
