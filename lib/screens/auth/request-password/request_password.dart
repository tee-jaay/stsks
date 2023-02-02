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
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  HomeLogoLink(imagePath: 'assets/images/auth/passwd-req.png'),
                  Text("Request reset password link"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
