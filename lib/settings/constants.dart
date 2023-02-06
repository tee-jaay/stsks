import 'package:flutter/material.dart';

// info
const String appName = "PROZEQTS";

// colors
const appPrimaryColor = Color(0xFF0C9869);
const appTextColor = Color(0xFF3C4046);
const appBackgroundColor = Color(0xFFF9F8FD);
const appBackgroundColorLight = Color(0xFFf1f1f1);

const projectColor = Color(0xFF0C9869);
const taskColor = Color(0xff0b83ee);
const issueColor = Color(0xff8a2fe0);
const meetingColor = Color(0xffcb809a);

// spacing
const double appDefaultSpace = 16.0;

// Form validation
const String emailPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
RegExp regExpEmail = RegExp(
  emailPattern,
  multiLine: false,
  caseSensitive: false,
);
const String passwordPattern = r"";
RegExp regExpPassword = RegExp(
  passwordPattern,
  multiLine: false,
  caseSensitive: true,
);
// const String passwordPattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{4,}$";
// RegExp regExpPassword = RegExp(
//   passwordPattern,
//   multiLine: false,
//   caseSensitive: true,
// );
