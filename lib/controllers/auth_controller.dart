import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class AuthController extends HttpRequestsService with ChangeNotifier {
  int _httpResponseStatus = 0;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  Future<int> signUp(Object obj) async {
    print(obj);
    var response = await requestApi(
        endpoint: '${dotenv.env["API_BASE"]}/$AUTH_SIGN_UP',
        reqMethod: 'POST',
        object: obj);
    print(jsonDecode(response.body));
    return _httpResponseStatus;
  }

  Future<int> signIn(Object obj) async {
    var response = await requestApi(
        endpoint: '${dotenv.env["API_BASE"]}/$AUTH_SIGN_IN',
        object: obj,
        reqMethod: 'POST');
    print(jsonDecode(response.body));
    return _httpResponseStatus;
  }
}
