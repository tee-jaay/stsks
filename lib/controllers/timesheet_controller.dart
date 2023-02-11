import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/timesheet.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class TimesheetController extends HttpRequestsService with ChangeNotifier {
  late List<TimeSheet> timeSheetsList = [];

  Future<void> index(
      {required String projectId, required String accessToken}) async {
    timeSheetsList.clear();
    var endpoint = '$TIMESHEETS/$projectId';
    var result = await requestApi(
        endpoint: endpoint,
        object: {},
        reqMethod: "GET",
        accessToken: accessToken);
    if(result.statusCode == 200) {
      timeSheetsList.clear();
      var data = jsonDecode(result.body);
      for (var i = 0; i < data.length; i++) {
        String id = data[i]["id"] ?? '';
        String projectId = data[i]["projectId"] ?? '';
        String taskId = data[i]["taskId"] ?? '';
        String task = data[i]["task"] ?? '';
        String createdBy = data[i]["createdBy"] ?? '';
        String title = data[i]["title"] ?? '';
        List<dynamic> logs = data[i]["logs"];
        timeSheetsList.add(TimeSheet(
            id: id,
            projectId: projectId,
            taskId: taskId,
            task: task,
            createdBy: createdBy,
            title: title,
            logs: logs));
      }
    }
    notifyListeners();
  }

  Future<int> store(
      {required String projectId, required String accessToken, required Object newObj}) async {
    print(newObj);
    timeSheetsList.clear();
    var endpoint = '$TIMESHEETS_CREATE/$projectId';
    var result = await requestApi(
        endpoint: endpoint,
        object: newObj,
        reqMethod: "POST",
        accessToken: accessToken);
    if(result.statusCode == 201) {
      timeSheetsList.clear();
    }
    return result.statusCode;
  }
}
