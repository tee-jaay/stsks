import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stasks/constants.dart';
import 'package:stasks/screens/home/components/section_title.dart';

class DeployedUsing extends StatelessWidget {
  const DeployedUsing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(stDefaultSpace),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            child: SectionTitle(
              title: "Deployed using",
            ),
          ),
          SizedBox(
            height: stDefaultSpace * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Heroku",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                "Netlify",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          SizedBox(
            height: stDefaultSpace * 4,
          ),
        ],
      ),
    );
  }
}
