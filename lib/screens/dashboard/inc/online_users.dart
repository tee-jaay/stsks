import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stasks/settings/constants.dart';

class OnlineUsers extends StatefulWidget {
  const OnlineUsers({Key? key}) : super(key: key);

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
        OnLineUserCard(
          press: () {
            if (kDebugMode) {
              print("online user 1");
            }
          },
          imgSrc: "https://i.pravatar.cc/300",
          role: "Admin",
          name: "Jhon Doe",
          email: "jhondoe@example.com",
        ),
        OnLineUserCard(
          press: () {
            if (kDebugMode) {
              print("online user 2");
            }
          },
          imgSrc: "https://i.pravatar.cc/300",
          role: "visitor",
          name: "Luz O'Reilly DVM",
          email: "0Casper560@example.com",
        ),
        OnLineUserCard(
          press: () {
            if (kDebugMode) {
              print("online user 3");
            }
          },
          imgSrc: "https://i.pravatar.cc/300",
          role: "client",
          name: "Scott Wunsch",
          email: "6Hudson_Bruen6@example.com",
        ),
        OnLineUserCard(
          press: () {
            if (kDebugMode) {
              print("online user 4");
            }
          },
          imgSrc: "https://i.pravatar.cc/300",
          role: "user",
          name: "Harry Roberts",
          email: "2Jocelyn_Cronin2@example.com",
        ),
        OnLineUserCard(
          press: () {
            if (kDebugMode) {
              print("online user 5");
            }
          },
          imgSrc: "https://i.pravatar.cc/300",
          role: "client",
          name: "Jackie Runolfsdottir",
          email: "4Layla_Skiles154@example.com",
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
    required this.email,
    required this.imgSrc,
    required this.press,
  }) : super(key: key);

  final String name, role, email, imgSrc;
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
                Text(
                  email,
                  style: const TextStyle(
                    color: Color(0xff666666),
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
