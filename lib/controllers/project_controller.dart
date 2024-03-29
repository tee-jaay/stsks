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

  Future<void> index({required int limit, required String accessToken}) async {
    var endpoint = '$PROJECTS_BY_LIMIT/$limit';
    final result = await httpRequestsService.requestApi(
        endpoint: endpoint,
        object: {},
        reqMethod: "GET",
        accessToken: accessToken);
    if (result.statusCode == 200) {
      projects.clear();
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
    }
    notifyListeners();
  } // index

  Future<ProjectDetail> show(
      {required String id, required String accessToken}) async {
    loading = true;
    var result = await httpRequestsService.requestApi(
        object: {},
        endpoint: '$PROJECTS/$id',
        reqMethod: 'GET',
        accessToken: accessToken);
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

  Future<int> commentStore(
      {required String comment,
      required String commentBy,
      required String accessToken,
      required String projectId}) async {
    var result = await httpRequestsService.requestApi(
        object: {"comment": comment, "commentBy": commentBy},
        endpoint: '$PROJECTS_COMMENTS/$projectId',
        reqMethod: 'PATCH',
        accessToken: accessToken);
    return result.statusCode;
  }
}
