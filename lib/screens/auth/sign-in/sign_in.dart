import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String screenId = "sign_in";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sign in screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
