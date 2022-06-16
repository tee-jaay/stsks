import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/welcomeDate.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final scrWidth = MediaQuery.of(context).size.width * 0.8;
    late final scrHeight = MediaQuery.of(context).size.height * 0.5;
    late String scrWidthStr = scrWidth.toString().substring(0, 2);
    late String scrHeightStr = scrHeight.toString().substring(0, 2);

    return Padding(
      padding: EdgeInsets.all(stDefaultSpace),
      child: Column(
        children: [
          welcomeDate(),
          Row(
            children: [
              Container(
                  width: scrWidth,
                  height: scrHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/$scrHeightStr/$scrWidthStr"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text("Projects")),
            ],
          ),
        ],
      ),
    );
  }
}
