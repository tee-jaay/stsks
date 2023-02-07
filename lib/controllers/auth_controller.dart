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

  User get user => _user;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<int> signUp(Object obj) async {
    loading = true;
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
    loading = false;
    notifyListeners();
    return _httpResponseStatus;
  }

  Future<int> signIn(Object obj) async {
    loading = true;
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
    loading = false;
    notifyListeners();
    return _httpResponseStatus;
  }

  void singOut() {
    _user.id = '';
    _user.username = '';
    _user.accessToken = '';
    _user.isAuthenticated = false;
  }

  void _authenticateUser(
      String id, String username, String accessToken, bool isAuthenticated) {
    _user.id = id;
    _user.username = username;
    _user.accessToken = accessToken;
    _user.isAuthenticated = isAuthenticated;
  }
}
