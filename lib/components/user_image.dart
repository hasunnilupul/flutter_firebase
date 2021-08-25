import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7, right: 6, bottom: 7),
      child: CircleAvatar(
        radius: 24,
        backgroundImage: ExtendedNetworkImageProvider(
          user?.photoURL ?? '',
          cache: true,
          retries: 0,
          cacheMaxAge: Duration(minutes: 20),
        ),
      ),
    );
  }
}
