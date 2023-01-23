import 'package:flutter/foundation.dart';

import '../services/http_requests_service.dart';
import '../settings/api_endpoints.dart';

class ProfileController with ChangeNotifier {
  void index({String userId: 'mWorQlHzk64nKLcl-LSZD'}) async {
    print("profile");
    var endpoint = '$USERS/$userId/profile';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService
        .requestApi(object: {}, endpoint: endpoint, reqMethod: 'GET');
    print("profile");
    print(result);
  }
}
