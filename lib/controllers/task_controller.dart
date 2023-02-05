import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/TaskPreview.dart';
import '../models/task.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class TaskController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  late List<TaskPreview> tasksPreviews = [];

  late Task task = Task(
      id: '',
      projectId: '',
      createdBy: '',
      title: '',
      description: '',
      bookmark: '',
      status: '',
      plannedStart: '',
      plannedEnd: '',
      actualStart: '',
      actualEnd: '',
      priority: '',
      color: '',
      month: '',
      year: '');

  Future<void> index(
      {required String projectId, required String accessToken}) async {
    var endpoint = '$TASKS/$projectId';
    var result = await httpRequestsService.requestApi(
        endpoint: endpoint,
        object: {},
        reqMethod: "GET",
        accessToken: accessToken);
    if (result.statusCode == 200) {
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
    var endpoint = '$TASKS_SHOW/$taskId';
    var result = await httpRequestsService.requestApi(
        object: {},
        endpoint: endpoint,
        reqMethod: "GET",
        accessToken: accessToken);
    if (result.statusCode == 200) {
      final data = jsonDecode(result.body)[0];
      task.id = data["id"];
      task.projectId = data["projectId"];
      task.createdBy = data["createdBy"];
      task.title = data["title"];
      task.status = data["status"];
      task.plannedStart = data["plannedStart"];
      task.plannedEnd = data["plannedEnd"];
      task.priority = data["priority"];

      // task.description = data["description"];
      // task.bookmark = data["bookmark"];
      // task.actualStart = data["actualStart"];
      // task.actualEnd = data["actualEnd"];
      // task.color = data["color"];
      // task.month = data["month"];
      // task.year = data["year"];
    }
    notifyListeners();
  }

  Future<void> store(
      {required String projectId, required String accessToken}) async {
    var newTask = {
      "projectId": projectId,
      "createdBy": "xyz123",
      "title": "task ${DateTime.now().toString()}",
      "description": 'description ${DateTime.now().toString()}',
      "bookmark": false,
      "status": "active",
      "plannedStart": "2023-2-12",
      "plannedEnd": "2023-2-16",
      "actualStart": "2023-3-12",
      "actualEnd": "2023-5-16",
      "priority": "High",
      "color": "red"
    };
    var endpoint = TASKS_STORE;
    var result = await httpRequestsService.requestApi(
        object: newTask,
        endpoint: endpoint,
        reqMethod: "POST",
        accessToken: accessToken);
    if (result.statusCode == 201) {
      print('Task created');
    }
  }
}
