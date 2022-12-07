import 'package:flutter/material.dart';

class RequestPasswordScreen extends StatelessWidget {
  const RequestPasswordScreen({Key? key}) : super(key: key);

  static String screenId = "request_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password reset"),
      ),
      body: const Text("Request reset password link"),
    );
  }
}
