import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier{
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  Future<void> signUp(Object obj) async {
    print(obj);
  }

  Future<void> signIn(Object obj) async {
    print(obj);
  }
}
