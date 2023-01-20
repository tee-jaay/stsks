import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String screenId = "sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
