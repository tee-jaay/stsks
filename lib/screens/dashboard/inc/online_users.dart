import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../settings/constants.dart';

class OnlineUsers extends StatefulWidget {
  OnlineUsers({required this.usersOnline, Key? key}) : super(key: key);
  List usersOnline;

  @override
  State<OnlineUsers> createState() => _OnlineUsersState();
}

class _OnlineUsersState extends State<OnlineUsers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Users online now",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(
          height: appDefaultSpace,
        ),
        Container(
          height: widget.usersOnline.length * 60,
          child: ListView.builder(
            itemBuilder: (context, index) => OnLineUserCard(
              press: () {
                if (kDebugMode) {
                  print("online user $index");
                }
              },
              imgSrc: widget.usersOnline[index].profileAvatar,
              role: widget.usersOnline[index].roleType,
              name: widget.usersOnline[index].name,
            ),
            itemCount: widget.usersOnline.length,
          ),
        ),
      ],
    );
  }
}

class OnLineUserCard extends StatelessWidget {
  const OnLineUserCard({
    Key? key,
    required this.name,
    required this.role,
    required this.imgSrc,
    required this.press,
  }) : super(key: key);

  final String name, role, imgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: appDefaultSpace * 0.4),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.green,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imgSrc),
            ),
            const SizedBox(
              width: appDefaultSpace * 0.4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              role.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
