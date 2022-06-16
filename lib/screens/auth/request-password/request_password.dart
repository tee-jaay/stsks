import 'package:flutter/material.dart';

class RequestPasswordScreen extends StatelessWidget {
  const RequestPasswordScreen({Key? key}) : super(key: key);

  static String screenId = "request_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password reset"),
      ),
      body: Text("Request reset password link"),
    );
  }
}
