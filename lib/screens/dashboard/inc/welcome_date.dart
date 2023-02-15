import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';

class WelcomeDate extends StatelessWidget {
  const WelcomeDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).user;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.MMMd().format(now);

    return Row(
      children: [
        Text(
          "Hello, ${user.username}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(formattedDate),
      ],
    );
  }
}
