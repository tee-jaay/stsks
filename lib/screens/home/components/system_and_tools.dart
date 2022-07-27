import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';
import 'package:stasks/screens/home/components/section_title.dart';

class SystemAndTools extends StatelessWidget {
  const SystemAndTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(stDefaultSpace),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: stDefaultSpace * 4,
          ),
          const SectionTitle(
            title: "System and Tools",
          ),
          const SizedBox(
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
          const SizedBox(
            height: stDefaultSpace * 2,
          ),
        ],
      ),
    );
  }
}
