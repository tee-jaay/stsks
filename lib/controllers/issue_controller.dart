import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/issue.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class IssueController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  late List<Issue> issues = [];

  Future<void> index(String projectId) async {
    issues.clear();
    var endpoint = '$ISSUES/$projectId';
    var result = await httpRequestsService.requestApi(
      object: {},
      endpoint: endpoint,
      reqMethod: 'GET',
      accessToken: ''
    );
    var data = jsonDecode(result.body);

    for (var i = 0; i < data.length; i++) {
      String id = data[i]["id"] ?? '';
      String taskId = data[i]["taskId"] ?? '';
      String projectId = data[i]["projectId"] ?? '';
      String createdBy = data[i]["createdBy"] ?? '';
      String title = data[i]["title"] ?? '';
      String description = data[i]["description"] ?? '';
      String bookmark = data[i]["bookmark"].toString() ?? '';
      String status = data[i]["status"] ?? '';
      String start = data[i]["start"] ?? '';
      String end = data[i]["end"] ?? '';
      String priority = data[i]["priority"] ?? '';
      String type = data[i]["type"] ?? '';
      String severity = data[i]["severity"] ?? '';
      List comments = data[i]["comments"];
      issues.add(Issue(
        id: id,
        taskId: taskId,
        projectId: projectId,
        createdBy: createdBy,
        title: title,
        description: description,
        bookmark: bookmark,
        status: status,
        start: start,
        end: end,
        priority: priority,
        type: type,
        severity: severity,
        comments: comments,
      ));
    }
    notifyListeners();
  }
}
