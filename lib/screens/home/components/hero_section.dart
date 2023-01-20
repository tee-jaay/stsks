import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../settings/constants.dart';
import '../../dashboard/dashboard_screen.dart';
import '../../auth/sign-in/sign_in.dart';
import '../../auth/sign-up/sign_up.dart';
import '../home_screen.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  final HomeScreen widget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFf1f1f1),
      child: Column(
        children: [
          Image(image: AssetImage('assets/images/home/teaching.png')),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, DashboardScreen.screenId);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextLiquidFill(
                  text: appName,
                  waveColor: appPrimaryColor,
                  boxBackgroundColor: appBackgroundColorLight,
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.2,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 200.0,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.screenId);
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.screenId);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
