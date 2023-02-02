import 'package:flutter/foundation.dart';

import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class UserController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  void index({required String accessToken}) async {
    var endpoint = USERS;
    var result = await httpRequestsService.requestApi(
        object: {},
        endpoint: endpoint,
        reqMethod: "GET",
        accessToken: accessToken);
    if (result.statusCode == 200) {
      print("fetchUsers");
      print(result);
    }
    notifyListeners();
  }
}
