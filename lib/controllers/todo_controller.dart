import 'package:flutter/foundation.dart';

import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class TodoController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  void index({required String projectId, required String accessToken}) async {
    var endpoint = '$PROJECTS/$projectId/todos';
    var result = await httpRequestsService.requestApi(
        object: {},
        endpoint: endpoint,
        reqMethod: "GET",
        accessToken: accessToken);
    if (result.statusCode == 200) {
      print("index todos");
      print(result);
    }
    notifyListeners();
  }
}
