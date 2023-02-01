import 'package:flutter/material.dart';
import 'package:prozeqts/screens/auth/inc/home_logo_link.dart';

class RequestPasswordScreen extends StatelessWidget {
  const RequestPasswordScreen({Key? key}) : super(key: key);

  static String screenId = "request_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password reset"),
      ),
      body: Column(
        children: [
          HomeLogoLink(imagePath: 'assets/images/auth/passwd-req.png'),
          Text("Request reset password link"),
        ],
      ),
    );
  }
}
