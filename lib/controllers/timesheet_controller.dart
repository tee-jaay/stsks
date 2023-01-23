import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prozeqts/settings/api_endpoints.dart';

import '../services/http_requests_service.dart';

class TimesheetController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();

  void index({String projectId:'nf-dnpZ4Y4WVmRkzO4G8R'}) async {
    print("index timesheet");
    var endpoint =
        '$PROJECTS/$projectId/timesheets';
    var result = await httpRequestsService.requestApi(
      endpoint: endpoint,
      object: {},
      reqMethod: "method",
    );
    print("index timesheet");
    print(result);
  }
}
