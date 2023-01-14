import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../services/http_requests_service.dart';

class ProjectController with ChangeNotifier{

  void index() async {
    print("index Projects");
    var endpoint = '${dotenv.env["API_BASE"]}/projects-by-limit/6';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result =await httpRequestsService.fetchData(endpoint, "method");
    print("index Projects");
    print(result);
  }

  void show() async {
    print("project details ~~~~~~~~~~~~~~~~~~~~");
    var endpoint = '${dotenv.env["API_BASE"]}/projects/08650ddf-cd45-4464-a3c7-92e5064645bf';
    HttpRequestsService httpRequestsService = HttpRequestsService();
    var result =await httpRequestsService.fetchData(endpoint, "method");
    print("project details --------------------");
    print(result);
  }
}