import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/http_requests_service.dart';

class TodoController with ChangeNotifier {
  void index() async {
    print("index todos");
    // Todo: update endpoint in server side to ""
    //var endpoint =        '${dotenv.env["API_BASE"]}/todos' ;
    var endpoint = '${dotenv.env["API_BASE"]}/projects/nf-dnpZ4Y4WVmRkzO4G8R/todos';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.fetchData(endpoint, "method");
    print("index todos");
    print(result);
  }
}