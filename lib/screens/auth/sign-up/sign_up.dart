import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String screenId = "sign_up";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
