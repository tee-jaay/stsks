import 'package:flutter/material.dart';
import 'package:stasks/screens/home/components/section_title.dart';

class SystemAndTools extends StatelessWidget {
  const SystemAndTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SectionTitle(
        title: "System and Tools",
      ),
    );
  }
}
