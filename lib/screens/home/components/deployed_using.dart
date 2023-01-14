import 'package:flutter/material.dart';

import '../../../settings/constants.dart';
import 'section_title.dart';

class DeployedUsing extends StatelessWidget {
  const DeployedUsing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appDefaultSpace),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: "Deployed using",
          ),
          const SizedBox(
            height: appDefaultSpace * 4,
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
          const SizedBox(
            height: appDefaultSpace * 4,
          ),
        ],
      ),
    );
  }
}
