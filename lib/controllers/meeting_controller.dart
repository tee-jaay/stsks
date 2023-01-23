import 'package:flutter/foundation.dart';

import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class MeetingController with ChangeNotifier {
  void index({String projectId: 'nf-dnpZ4Y4WVmRkzO4G8R'}) async {
    print("index meetings");
    var endpoint = '$PROJECTS/$projectId/meetings';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
      endpoint: endpoint,
      object: {},
      reqMethod: 'GET',
    );
    print("index meetings");
    print(result);
  }
}
