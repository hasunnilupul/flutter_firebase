import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constants.dart';

import '../../animations/fade_animation_top_to_bottom.dart';
import '../Home/home_screen.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  @override
  _EmailVerifyScreenState createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;
  bool _verified = false;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.withOpacity(.6),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            _buildFadeAnimateTopToBottom(size, -50, 1, 'assets/images/one.png'),
            _buildFadeAnimateTopToBottom(
                size, -100, 1.3, 'assets/images/one.png'),
            _buildFadeAnimateTopToBottom(
                size, -150, 1.6, 'assets/images/one.png'),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimationTopToBottom(
                    0.7,
                    Text(
                      'Please \nverify your email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  FadeAnimationTopToBottom(
                    1,
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  FadeAnimationTopToBottom(
                    1.3,
                    Text(
                      "Thank you for connecting \n with us",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        height: 1.4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  FadeAnimationTopToBottom(
                    1.6,
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryLightColor.withOpacity(.4),
                        ),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryLightColor,
                          ),
                          child: _buildVerifyStatusIndicator(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      setState(() {
        _verified = true;
      });
      timer.cancel();
      Future.delayed(Duration(milliseconds: 450), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
  }

  Widget _buildFadeAnimateTopToBottom(
      Size size, double? top, double delay, String asset) {
    return Positioned(
      top: top,
      left: 0,
      child: FadeAnimationTopToBottom(
        delay,
        Container(
          width: size.width,
          height: size.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(asset),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  _buildVerifyStatusIndicator() {
    if (_verified) {
      return Icon(
        Icons.check,
        size: 40,
        color: Colors.green,
      );
    } else {
      return CircularProgressIndicator(
        color: primaryColor,
        strokeWidth: 6,
      );
    }
  }
}
