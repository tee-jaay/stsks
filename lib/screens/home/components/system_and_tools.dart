import 'package:flutter/material.dart';

import '../../../settings/constants.dart';
import 'section_title.dart';


class SystemAndTools extends StatelessWidget {
  const SystemAndTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appDefaultSpace),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: appDefaultSpace * 4,
          ),
          const SectionTitle(
            title: "System and Tools",
          ),
          const SizedBox(
            height: appDefaultSpace * 2,
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
          const SizedBox(
            height: appDefaultSpace * 2,
          ),
        ],
      ),
    );
  }
}
