import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);
  static String screenId = "new_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save new password"),
      ),
      body: Text("save new password form"),
    );
  }
}
