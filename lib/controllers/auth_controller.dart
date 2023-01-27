import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../models/user.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class AuthController extends HttpRequestsService with ChangeNotifier {
  int _httpResponseStatus = 0;
  bool _loading = false;
  late Timer? _authTimer;
  final User _user =
      User(id: '', username: '', accessToken: '', isAuthenticated: false);

  bool get loading => _loading;

  User get user => _user;

  Future<int> signUp(Object obj) async {
    _loading = true;
    var result = await requestApi(
        endpoint: AUTH_SIGN_UP,
        reqMethod: 'POST',
        object: obj,
        accessToken: '');
    final data = jsonDecode(result.body);
    _httpResponseStatus = result.statusCode;
    if (_httpResponseStatus == 200) {
      _authenticateUser(
          data["id"], data["username"], data["accessToken"], true);
    }
    _loading = false;
    notifyListeners();
    return _httpResponseStatus;
  }

  Future<int> signIn(Object obj) async {
    _loading = true;
    var result = await requestApi(
        endpoint: AUTH_SIGN_IN,
        object: obj,
        reqMethod: 'POST',
        accessToken: '');
    final data = jsonDecode(result.body);
    _httpResponseStatus = result.statusCode;
    if (_httpResponseStatus == 200) {
      _authenticateUser(
          data["id"], data["username"], data["accessToken"], true);
    }
    _loading = false;
    notifyListeners();
    return _httpResponseStatus;
  }

  void _authenticateUser(
      String id, String username, String accessToken, bool isAuthenticated) {
    _user.id = id;
    _user.username = username;
    _user.accessToken = accessToken;
    _user.isAuthenticated = isAuthenticated;
  }
}
