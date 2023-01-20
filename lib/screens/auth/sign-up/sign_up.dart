import 'package:flutter/material.dart';

import '../../../settings/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String screenId = "sign_up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email = '';
  late String _password = '';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  void _handleSubmit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    print('sign up');
    print(_email);
    print(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!regExpEmail.hasMatch(value)) {
                      return 'Email is invalid';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => setState(() {
                    _email = value;
                  }),
                  decoration: InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
                SizedBox(
                  height: appDefaultSpace,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else if (!regExpPassword.hasMatch(value)) {
                      return 'Password is weak';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => setState(() {
                    _password = value;
                  }),
                  decoration: InputDecoration(hintText: 'Password'),
                  obscureText: true,
                  focusNode: _passwordFocusNode,
                ),
                SizedBox(
                  height: appDefaultSpace,
                ),
                TextButton(
                  onPressed: _handleSubmit,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
