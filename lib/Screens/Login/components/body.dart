import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/already_have_an_account_check.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LOGIN',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'assets/icons/login.svg',
            height: size.height * 0.4,
          ),
          RoundedInputField(
            hintText: 'Your email',
            icon: Icons.person,
            onChanged: (text) {},
          ),
          RoundedPasswordField(
            onChanged: (text) {},
          ),
          RoundedButton(text: 'LOGIN', press: () {}),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            press: () {},
          )
        ],
      ),
    );
  }
}
