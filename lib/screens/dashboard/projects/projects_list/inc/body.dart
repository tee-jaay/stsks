import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(stDefaultSpace),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://picsum.photos/200/300"),
              ),
            ),
            child: Text(
              "Project title",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.5),
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
