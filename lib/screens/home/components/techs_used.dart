import 'package:flutter/material.dart';
import 'package:stasks/screens/home/components/section_title.dart';

class TechsUsed extends StatelessWidget {
  const TechsUsed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SectionTitle(
        title: "Techs Used",
      ),
    );
  }
}
