import 'package:flutter/material.dart';

import '../sign-in/sign_in.dart';
import '../../../controllers/auth_controller.dart';
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
  late String _username = '';
  late String _password = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _handleSubmit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    AuthController authController = AuthController();
    authController.signUp({"email": _email,"username":_username, "password": _password}).then((value) {
      if (value == 201) {
        Navigator.pushNamed(context, SignInScreen.screenId);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Sign up failed',
              style: TextStyle(color: Colors.amber),
            )));
      }
    });
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
                  decoration: const InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_usernameFocusNode),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),TextFormField(
                  controller: _usernameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Username is required';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => setState(() {
                    _username = value;
                  }),
                  decoration: const InputDecoration(hintText: 'Username'),
                  focusNode: _usernameFocusNode,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
                const SizedBox(
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
                  decoration: const InputDecoration(hintText: 'Password'),
                  obscureText: true,
                  focusNode: _passwordFocusNode,
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextButton(
                  onPressed: _handleSubmit,
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
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
