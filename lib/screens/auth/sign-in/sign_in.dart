import 'package:flutter/material.dart';

import '../../../controllers/auth_controller.dart';
import '../sign-up/sign_up.dart';
import '../../../settings/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String screenId = "sign_in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email = '';
  late String _password = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  void _handleSubmit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    AuthController authController = AuthController();
    authController.signIn({"email": _email, "password": _password});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!regExpEmail.hasMatch(value)) {
                      return 'Email is invalid';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => setState(() {
                    _email = value;
                  }),
                  decoration: const InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
                SizedBox(
                  height: appDefaultSpace,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else if (!regExpPassword.hasMatch(value)) {
                      return 'Password is weak';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => setState(() {
                    _password = value;
                  }),
                  decoration: const InputDecoration(hintText: 'Password'),
                  obscureText: true,
                  focusNode: _passwordFocusNode,
                ),
                SizedBox(
                  height: appDefaultSpace,
                ),
                TextButton(
                  onPressed: _handleSubmit,
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  height: appDefaultSpace,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.screenId);
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                            text: ' Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const TextSpan(text: ' here'),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
