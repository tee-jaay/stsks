import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stasks/screens/home/components/section_title.dart';

class DeployedUsing extends StatelessWidget {
  const DeployedUsing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SectionTitle(
        title: "System and Tools",
      ),
    );
  }
}
