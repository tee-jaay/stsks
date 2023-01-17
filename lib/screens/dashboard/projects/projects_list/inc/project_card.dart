import 'package:flutter/material.dart';

import '../../../../../settings/constants.dart';
import '../../project_detail/project_detail_screen.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.imgUrl,
      required this.status,
      required this.commentsCount})
      : super(key: key);

  String id;
  String title;
  String imgUrl;
  String status;
  String commentsCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(appDefaultSpace),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imgUrl),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Text(
                title,
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
            bottom: appDefaultSpace,
            left: appDefaultSpace * 1.4,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, ProjectDetailScreen.screenId,
                      arguments: id);
                },
                child: const Text('view'))),
      ],
    );
  }
}
