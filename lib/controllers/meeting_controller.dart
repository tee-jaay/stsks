import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/http_requests_service.dart';

class MeetingController with ChangeNotifier {
  void index() async {
    print("index meetings");
    var endpoint =
        '${dotenv.env["API_BASE"]}/projects/nf-dnpZ4Y4WVmRkzO4G8R/meetings';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result = await httpRequestsService.requestApi(
      endpoint: endpoint,
      object: {},
      reqMethod: 'GET',
    );
    print("index meetings");
    print(result);
  }
}
