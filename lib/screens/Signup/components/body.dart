import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

import '../../../components/already_have_an_account_check.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../../services/auth_service.dart';
import '../../../wrapper.dart';
import '../../Login/login_screen.dart';
import '../../Signup/components/or_divider.dart';
import 'background.dart';
import 'social_icon.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    Size _size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    String _email = '';
    String _password = '';

    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _size.height * 0.07,
              ),
              Text(
                'SIGN UP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: _size.height * 0.03,
              ),
              SvgPicture.asset(
                'assets/icons/signup.svg',
                height: _size.height * 0.35,
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
                  text: 'SIGN UP',
                  press: () async {
                    if (_registerFormKey.currentState!.validate()) {
                      _registerFormKey.currentState!.save();
                      try {
                        await _authService.createUserWithEmailAndPassword(
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
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/login'),
                                child: const Text('Sign in'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      print('Invalid form');
                    }
                  }),
              SizedBox(
                height: _size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    Transition(
                        child: LoginScreen(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
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
                            MaterialPageRoute(
                              builder: (context) => Wrapper(),
                            ));
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
