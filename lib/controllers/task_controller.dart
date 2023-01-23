import 'package:flutter/foundation.dart';

import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class TaskController with ChangeNotifier {
  void index({String projectId: 'nf-dnpZ4Y4WVmRkzO4G8R'}) async {
    var endpoint = '$PROJECTS/$projectId/tasks';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
      endpoint: endpoint,
      object: {},
      reqMethod: "GET",
    );
    print("index tasks");
    print(result);
  }

  void show(
      {String projectId: 'nf-dnpZ4Y4WVmRkzO4G8R',
      String taskId: 'L7u9AzHRUXMz1kblk-Kgg'}) async {
    print("detail task");
    var endpoint = '$PROJECTS/$projectId/tasks/$taskId';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
      object: {},
      endpoint: endpoint,
      reqMethod: "method",
    );
    print("detail task");
    print(result);
  }
}
