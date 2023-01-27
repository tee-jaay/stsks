import 'package:flutter/foundation.dart';

import '../services/http_requests_service.dart';
import '../settings/api_endpoints.dart';

class ProfileController with ChangeNotifier {
  void index({required String userId, required String accessToken}) async {
    print("profile");
    var endpoint = '$USERS/$userId/profile';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
        object: {},
        endpoint: endpoint,
        reqMethod: 'GET',
        accessToken: accessToken);
    print("profile");
    print(result);
  }
}
