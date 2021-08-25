import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

import '../../../components/already_have_an_account_check.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../../services/auth_service.dart';
import '../../../wrapper.dart';
import '../../Signup/components/or_divider.dart';
import '../../Signup/components/social_icon.dart';
import '../../Signup/signup_screen.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    Size _size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    String _email = '';
    String _password = '';

    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _size.height * 0.06,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: _size.height * 0.03,
              ),
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: _size.height * 0.4,
              ),
              RoundedInputField(
                hintText: 'Your email',
                icon: Icons.person,
                controller: _emailController,
                onChanged: (text) {},
                validator: (text) {
                  if (text!.trim().isEmpty || text.length < 2) {
                    return 'email address is required';
                  }
                  return null;
                },
                saved: (value) {
                  _email = value!;
                },
              ),
              RoundedPasswordField(
                controller: _passwordController,
                onChanged: (text) {},
                validator: (text) {
                  if (text!.trim().isEmpty) {
                    return 'password is required.';
                  }
                  if (text.length < 8) {
                    return 'Password must be at least 8 characters long.';
                  }
                  return null;
                },
                saved: (value) {
                  _password = value!;
                },
              ),
              RoundedButton(
                  text: 'LOGIN',
                  press: () async {
                    if (_loginFormKey.currentState!.validate()) {
                      _loginFormKey.currentState!.save();
                      try {
                        await _authService.signInWithEmailAndPassword(
                            _email, _password);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wrapper(),
                            ));
                      } on FirebaseAuthException catch (ex) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Something went wrong'),
                            content: Text('${ex.message}'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }),
              SizedBox(
                height: _size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    Transition(
                        child: SignUpScreen(),
                        transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                    iconSrc: 'assets/icons/google-plus.svg',
                    iconColor: Colors.red,
                    press: () async {
                      try {
                        await _authService.signInWithGoogle();
                        Navigator.pushReplacement(
                          context,
                          Transition(
                              child: Wrapper(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                        );
                      } on FirebaseAuthException catch (ex) {
                        print(ex.message);
                      }
                    },
                  ),
                  SocialIcon(
                    iconSrc: 'assets/icons/facebook.svg',
                    iconColor: Colors.indigo,
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: 'assets/icons/twitter.svg',
                    iconColor: Colors.blue,
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: _size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
