import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/TaskPreview.dart';
import '../models/task.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class TaskController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  late List<TaskPreview> tasksPreviews = [];

  Future<void> index(
      {required String projectId, required String accessToken}) async {
    var endpoint = '$TASKS/$projectId';
    var result = await httpRequestsService.requestApi(
        endpoint: endpoint,
        object: {},
        reqMethod: "GET",
        accessToken: accessToken);
    if(result.statusCode == 200){
      tasksPreviews.clear();
      final data = jsonDecode(result.body);
      var tempData = List.from(data);
      for (var task in tempData) {
        String id = task["id"].toString() ?? '';
        String createdBy = task["createdBy"].toString() ?? '';
        String title = task["title"].toString() ?? '';
        String status = task["status"].toString() ?? '';
        String plannedStart = task["plannedStart"].toString() ?? '';
        String plannedEnd = task["plannedEnd"].toString() ?? '';
        String priority = task["priority"].toString() ?? '';
        tasksPreviews.add(TaskPreview(
          id: id,
          projectId: projectId,
          createdBy: createdBy,
          title: title,
          status: status,
          plannedStart: plannedStart,
          plannedEnd: plannedEnd,
          priority: priority,
        ));
      }
    }
    notifyListeners();
  }

  Future<void> show(
      {required String projectId,
      required String taskId,
      required String accessToken}) async {
    var endpoint = '$PROJECTS/$projectId/tasks/$taskId';
    var result = await httpRequestsService.requestApi(
        object: {},
        endpoint: endpoint,
        reqMethod: "method",
        accessToken: accessToken);
    if(result.statusCode == 200){
      print("detail task");
      print(result);
    }
    notifyListeners();
  }
}
