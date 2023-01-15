import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/http_requests_service.dart';

class TaskController with ChangeNotifier {
  void index() async {
    print("index tasks");
    // var endpoint =        '${dotenv.env["API_BASE"]}/tasks/project/nf-dnpZ4Y4WVmRkzO4G8R';
    var endpoint =
        '${dotenv.env["API_BASE"]}/projects/nf-dnpZ4Y4WVmRkzO4G8R/tasks';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.fetchData(endpoint, "method");
    print("index tasks");
    print(result);
  }

  void show() async {
    print("detail task");
    //var endpoint = '${dotenv.env["API_BASE"]}/tasks/L7u9AzHRUXMz1kblk-Kgg';
    var endpoint = '${dotenv.env["API_BASE"]}/projects/nf-dnpZ4Y4WVmRkzO4G8R/tasks/L7u9AzHRUXMz1kblk-Kgg';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.fetchData(endpoint, "method");
    print("detail task");
    print(result);
  }
}
