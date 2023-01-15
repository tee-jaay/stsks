import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/http_requests_service.dart';

class ProfileController with  ChangeNotifier{
  void index() async {
    print("profile");
    //var endpoint = '${dotenv.env["API_BASE"]}/profiles/user/mWorQlHzk64nKLcl-LSZD';
    var endpoint = '${dotenv.env["API_BASE"]}/users/mWorQlHzk64nKLcl-LSZD/profile';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result =await httpRequestsService.fetchData(endpoint, "method");
    print("profile");
    print(result);
  }
}