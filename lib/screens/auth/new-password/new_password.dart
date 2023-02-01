import 'package:flutter/material.dart';
import 'package:prozeqts/screens/auth/inc/home_logo_link.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);
  static String screenId = "new_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save new password"),
      ),
      body: Column(
        children: [
          HomeLogoLink(imagePath: 'assets/images/auth/newpwd.png'),
          Text("save new password form"),
        ],
      ),
    );
  }
}
