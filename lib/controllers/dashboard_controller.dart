import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/dashboard.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class DashboardController extends HttpRequestsService with ChangeNotifier {
  bool _loading = false;
  List statData = [];
  List<RecentProject> recentProjects = [];
  List<LatestOpenIssues> latestOpenIssues = [];
  List<UsersOnline> usersOnline = [];
  List<TasksCountByPriority> tasksCountByPriority = [];

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  Future<int> index({required String accessToken, required}) async {
    loading = true;
    clearAll();

    var result = await requestApi(
        endpoint: DASHBOARD,
        reqMethod: 'GET',
        object: '',
        accessToken: accessToken);
    final decodedData = jsonDecode(result.body);
// Stats data
    statData.add(StatData(
      today: decodedData["today"],
      allProjectsCount: decodedData["allProjectsCount"].toString(),
      allTasksCount: decodedData["allTasksCount"].toString(),
      allIssuesCount: decodedData["allIssuesCount"].toString(),
      allMeetingsCount: decodedData["allMeetingsCount"].toString(),
    ));
// Recent projects
    decodedData["recentProjects"].forEach((data) {
      recentProjects.add(
        RecentProject(
          id: data["id"],
          title: data["title"],
          status: data["status"],
        ),
      );
    });
// Latest open issues
    decodedData["latestOpenIssues"].forEach((data) {
      latestOpenIssues.add(LatestOpenIssues(
          id: data["id"],
          projectId: data["projectId"],
          createdBy: data["createdBy"],
          title: data["title"],
          status: data["status"],
          type: data["type"],
          severity: data["severity"],
          createdAt: data["createdAt"]));
    });
//    Tasks Count By Priority
    decodedData["tasksCountByPriority"].forEach((data) {
      tasksCountByPriority
          .add(TasksCountByPriority(id: data["_id"], count: data["count"]));
    });
// Users online
    decodedData["users"].forEach((data) {
      usersOnline.add(UsersOnline(
        id: data["id"],
        name: data["name"],
        profileAvatar: data["profile"]["avatar"],
        roleType: data["role"]["type"],
      ));
    });

    notifyListeners();
    loading = false;
    return result.statusCode;
  }

  void clearAll() {
    statData.clear();
    recentProjects.clear();
    tasksCountByPriority.clear();
    latestOpenIssues.clear();
    usersOnline.clear();
  }
}
