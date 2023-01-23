import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpRequestsService {
  final Map<String, Function> _methods = {
    'GET': http.get,
    'POST': http.post,
    'PUT': http.put,
    'DELETE': http.delete,
  };

  Future<http.Response> requestApi({
    required String endpoint,
    required String reqMethod,
    required Object object,
  }) async {
    final uri = Uri.parse(endpoint);
    final headers = {
      "Authorization": "Bearer ${dotenv.env['TMP_AUTH_TOKEN']}",
      "Content-Type": "application/json"
    };
    final Function? method = _methods[reqMethod];
    if (method == null) {
      throw Exception('Unsupported request method');
    }
    http.Response response;
    if (reqMethod != 'GET') {
      response = await method(
        uri,
        headers: headers,
        body: jsonEncode(object),
      );
    } else {
      response = await method(
        uri,
        headers: headers,
      );
    }
    return response;
  }
} // HttpRequestsService
