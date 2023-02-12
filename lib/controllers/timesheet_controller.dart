import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/timesheet.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class TimesheetController extends HttpRequestsService with ChangeNotifier {
  late List<TimeSheet> timeSheetsList = [];

  Future<void> index(
      {required String projectId, required String accessToken}) async {
    clearTimeSheet();
    var result = await requestApi(
        endpoint: '$TIMESHEETS/$projectId',
        object: {},
        reqMethod: "GET",
        accessToken: accessToken);
    if (result.statusCode == 200) {
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
      {required String projectId,
      required String accessToken,
      required Object newObj}) async {
    var endpoint = '$TIMESHEETS/$projectId';
    var result = await requestApi(
        endpoint: endpoint,
        object: newObj,
        reqMethod: "POST",
        accessToken: accessToken);
    return result.statusCode;
  }

  Future<int> update(
      {required String timeSheetId,
      required String accessToken,
      required Object newObj}) async {
    var endpoint = '$TIMESHEETS_LOG/$timeSheetId';
    var result = await requestApi(
        endpoint: endpoint,
        object: newObj,
        reqMethod: "PATCH",
        accessToken: accessToken);
    return result.statusCode;
  }

  void clearTimeSheet() {
    timeSheetsList.clear();
  }
}
