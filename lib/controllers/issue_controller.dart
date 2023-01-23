import 'package:flutter/foundation.dart';

import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class IssueController with ChangeNotifier {
  void index({String projectId: 'nf-dnpZ4Y4WVmRkzO4G8R'}) async {
    print("index issues");
    var endpoint = '$PROJECTS/$projectId/issues';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
      object: {},
      endpoint: endpoint,
      reqMethod: 'GET',
    );
    print("index issues");
    print(result);
  }
}
