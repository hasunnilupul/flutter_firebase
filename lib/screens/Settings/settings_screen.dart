import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    final currentUser = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${currentUser!.displayName}'),
            Text('${currentUser.email}'),
            OutlinedButton(
                onPressed: () async {
                  await _authService.signOut();
                },
                child: Text('Sign out')),
          ],
        ),
      ),
    );
  }
}
