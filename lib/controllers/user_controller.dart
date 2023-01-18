import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/http_requests_service.dart';

class UserController with  ChangeNotifier{
  void index() async {
    print("fetchUsers");
    var endpoint = '${dotenv.env["API_BASE"]}/users';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result =await httpRequestsService.requestApi(endpoint, "method");
    print("fetchUsers");
    print(result);
  }
}