import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/http_requests_service.dart';

class TimesheetController with ChangeNotifier {
  void index() async {
    print("index timesheet");
    var endpoint =
        '${dotenv.env["API_BASE"]}/timeSheets/project/nf-dnpZ4Y4WVmRkzO4G8R';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
      endpoint: endpoint,
      object: {},
      reqMethod: "method",
    );
    print("index timesheet");
    print(result);
  }
}
