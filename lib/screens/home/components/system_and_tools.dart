import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';
import 'package:stasks/screens/home/components/section_title.dart';

class SystemAndTools extends StatelessWidget {
  const SystemAndTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(stDefaultSpace),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: stDefaultSpace * 4,
          ),
          Container(
            child: SectionTitle(
              title: "System and Tools",
            ),
          ),
          SizedBox(
            height: stDefaultSpace * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "VS Code",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Github",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Chrome",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          SizedBox(
            height: stDefaultSpace * 2,
          ),
        ],
      ),
    );
  }
}
