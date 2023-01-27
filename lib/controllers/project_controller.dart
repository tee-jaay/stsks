import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../settings/api_endpoints.dart';
import '../models/project_detail.dart';
import '../models/project_preview.dart';
import '../services/http_requests_service.dart';

class ProjectController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  late List<ProjectPreview> projects = [];
  bool loading = false;
  var projectDetail = null;

  Future<void> index(int limit, String accessToken) async {
    var endpoint = '$PROJECTS_BY_LIMIT/$limit';
    print('token: $accessToken');

    final result = await httpRequestsService.requestApi(
        endpoint: endpoint,
        object: {},
        reqMethod: "GET",
        accessToken: accessToken);
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
    var endpoint = '$PROJECTS/$id';
    var result = await httpRequestsService.requestApi(
        object: {}, endpoint: endpoint, reqMethod: 'GET', accessToken: '');
    final data = jsonDecode(result.body);

    projectDetail = ProjectDetail(
      id: data[0]["id"] ?? '',
      title: data[0]["title"] ?? '',
      image: data[0]["image"] ?? '',
      status: data[0]["status"] ?? '',
      slug: data[0]["slug"] ?? '',
      createdBy: data[0]["createdBy"] ?? '',
      description: data[0]["description"] ?? '',
      repoLink: data[0]["repoLink"] ?? '',
      urlOne: data[0]["urlOne"] ?? '',
      urlTwo: data[0]["urlTwo"] ?? '',
      estimate: data[0]["budget"][0]["estimate"].toString() ?? '',
      spent: data[0]["budget"][0]["spent"].toString() ?? '',
      createdAt: data[0]["createdAt"].toString() ?? '',
      updatedAt: data[0]["updatedAt"].toString() ?? '',
      assignees: data[0]["assignees"] as List<dynamic>,
      comments: data[0]["comments"] as List<dynamic>,
    );

    loading = false;
    notifyListeners();
    return projectDetail;
  } // show
}
