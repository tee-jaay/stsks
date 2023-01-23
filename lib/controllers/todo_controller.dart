import 'package:flutter/foundation.dart';

import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class TodoController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  void index({String projectId: 'nf-dnpZ4Y4WVmRkzO4G8R'}) async {
    print("index todos");
    // Todo: update endpoint in server side to ""
    var endpoint = '$PROJECTS/$projectId/todos';

    var result = await httpRequestsService.requestApi(
      object: {},
      endpoint: endpoint,
      reqMethod: "GET",
    );
    print("index todos");
    print(result);
  }
}
