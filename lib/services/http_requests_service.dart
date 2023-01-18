import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpRequestsService {
  Future<http.Response> requestApi(
    String endpoint,
    dynamic reqMethod,
  ) async {
    var uri = Uri.parse(endpoint);
    var response = await http.get(uri, headers: {
      "Authorization": "Bearer ${dotenv.env['TMP_AUTH_TOKEN']}",
      "Method": reqMethod,
    });
    return response;
  }
} // HttpRequestsService
