import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpRequestsService {
  Future<Map<String, Object>> fetchData(
    String endpoint,
    String reqMethod,
  ) async {
    var uri = Uri.parse(endpoint);
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer ${dotenv.env['TMP_AUTH_TOKEN']}",
    });
    return {"status": response.statusCode, "data": response.body};
  }
} // HttpRequestsService
