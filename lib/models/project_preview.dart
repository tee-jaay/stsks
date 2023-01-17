import 'package:flutter/cupertino.dart';

class ProjectPreview with ChangeNotifier {
  String id;
  String title;
  String imgUrl;
  String status;
  String commentsCount;

  ProjectPreview({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.status,
    required this.commentsCount,
  });
}
