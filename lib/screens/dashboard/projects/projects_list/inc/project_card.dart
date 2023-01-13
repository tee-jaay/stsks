import 'package:flutter/material.dart';

import '../../../../../settings/constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(stDefaultSpace),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://picsum.photos/200/300?q="),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Text(
                "Quisque molestie quam eget nunc laoreet",
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: stDefaultSpace,
          left: stDefaultSpace * 1.4,
          child: ElevatedButton(onPressed: (){print('pressed');}, child: const Text('view'))),
      ],
    );
  }
}
