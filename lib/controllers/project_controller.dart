import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/project_detail.dart';
import '../models/project_preview.dart';
import '../services/http_requests_service.dart';

class ProjectController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();
  late List<ProjectPreview> projects = [];

  bool loading = false;

  var projectDetail = null;

  Future<void> index({int limit = 4}) async {
    var endpoint = '${dotenv.env["API_BASE"]}/projects-by-limit/$limit';

    final result = await httpRequestsService.requestApi(endpoint, "get");
    final data = jsonDecode(result.body);
    for (var i = 0; i < data.length; i++) {
      var id = data[i]["id"] ?? '';
      var title = data[i]["title"] ?? '';
      var image = data[i]["image"] ?? '';
      var status = data[i]["status"] ?? '';
      var commentsCount = data[i]["commentsCount"] ?? '';
      projects.add(ProjectPreview(
          id: id,
          title: title,
          imgUrl: image,
          status: status,
          commentsCount: commentsCount));
    }
    notifyListeners();
  } // index

  Future<ProjectDetail> show(String id) async {
    loading = true;
    var endpoint = '${dotenv.env["API_BASE"]}/projects/$id';
    var result = await httpRequestsService.requestApi(endpoint, "get");
    final data = jsonDecode(result.body);
    print(data[0]);

    projectDetail = ProjectDetail(
        id: data[0]["id"] ?? '',
        title: data[0]["title"] ?? '',
        image: data[0]["image"] ?? '',
        status: data[0]["status"] ?? '',
        commentsCount: data[0]["comments"].length.toString() ?? '',
        slug: data[0]["slug"] ?? '',
        createdBy: data[0]["createdBy"] ?? '',
        description: data[0]["description"] ?? '',
        repoLink: data[0][" repoLink "] ?? '',
        urlOne: data[0]["urlOne"] ?? '',
        urlTwo: data[0]["urlTwo"] ?? '',
        estimate: data[0]["budget"][0]["estimate"].toString() ?? '',
        spent: data[0]["budget"][0]["spent"].toString() ?? '',
    );

    loading = false;
    notifyListeners();
    return projectDetail;
  } // show
}
