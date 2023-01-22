import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/http_requests_service.dart';

class IssueController with ChangeNotifier {
  void index() async {
    print("index issues");
    var endpoint =
        '${dotenv.env["API_BASE"]}/issues/project/nf-dnpZ4Y4WVmRkzO4G8R';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
      object: {},
      endpoint: endpoint,
      reqMethod: 'GET',
    );
    print("index issues");
    print(result);
  }
}
