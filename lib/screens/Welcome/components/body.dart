import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transition/transition.dart';

import '../../../components/rounded_button.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME TO FLIREB',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.push(
                  context,
                  Transition(
                    child: LoginScreen(),
                    transitionEffect: TransitionEffect.TOP_TO_BOTTOM,
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'SIGN UP',
              color: primaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  Transition(
                    child: SignUpScreen(),
                    transitionEffect: TransitionEffect.TOP_TO_BOTTOM,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
