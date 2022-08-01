import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';
import 'package:stasks/screens/dashboard/projects/projects_list/inc/project_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => ProjectCard(
              key: Key(index.toString()),
            )
    );
  }
}
