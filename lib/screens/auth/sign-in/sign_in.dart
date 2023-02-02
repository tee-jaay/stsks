import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prozeqts/screens/auth/inc/home_logo_link.dart';
import 'package:prozeqts/screens/auth/new-password/new_password.dart';
import 'package:prozeqts/screens/auth/request-password/request_password.dart';

import '../../dashboard/dashboard_screen.dart';
import '../../../controllers/auth_controller.dart';
import '../sign-up/sign_up.dart';
import '../../../settings/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String screenId = "sign_in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email = '';
  late String _password = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  _handleSubmit(BuildContext ctx) {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    Provider.of<AuthController>(ctx, listen: false)
        .signIn({"email": _email, "password": _password}).then((value) {
      if (value == 200) {
        Navigator.of(ctx).pushReplacementNamed(DashboardScreen.screenId);
      } else {
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
            content: Text(
          'Sign in failed',
          style: TextStyle(color: Colors.amber),
        )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var loading = Provider.of<AuthController>(context, listen: true).loading;
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeLogoLink(imagePath: 'assets/images/home/teaching.png'),
                    TextFormField(
                      readOnly: loading,
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
                      onFieldSubmitted: (value) => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                    ),
                    const SizedBox(
                      height: appDefaultSpace,
                    ),
                    TextFormField(
                      readOnly: loading,
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
                      onPressed: () => _handleSubmit(context),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            loading ? Colors.grey : Colors.blueAccent),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: loading ? Colors.black87 : Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: appDefaultSpace,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.screenId);
                      },
                      child: RichText(
                        text: const TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: ' Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              TextSpan(text: ' here'),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: appDefaultSpace * 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RequestPasswordScreen.screenId);
                      },
                      child: RichText(
                        text: const TextSpan(
                            text: 'Forgot password?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: ' reset',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  )),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
