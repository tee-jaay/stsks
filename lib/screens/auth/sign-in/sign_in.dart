import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prozeqts/screens/auth/inc/home_logo_link.dart';

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
    final loading = Provider.of<AuthController>(context, listen: false).loading;
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeLogoLink(
                          imagePath: 'assets/images/home/teaching.png'),
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
                        onFieldSubmitted: (value) => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
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
                        onPressed:
                            loading ? null : () => _handleSubmit(context),
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueAccent),
                        ),
                        child: loading
                            ? const Text(
                                '...',
                                style: TextStyle(color: Colors.red),
                              )
                            : const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
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
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
