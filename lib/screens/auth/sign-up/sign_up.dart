import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String screenId = "sign_up";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sign up screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
