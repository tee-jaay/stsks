import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/project_preview.dart';
import '../services/http_requests_service.dart';

class ProjectController with ChangeNotifier {
  HttpRequestsService httpRequestsService = HttpRequestsService();
  late List<ProjectPreview> projects = [];

  Future<void> index({int limit = 4}) async {
    var endpoint = '${dotenv.env["API_BASE"]}/projects-by-limit/$limit';

    final result = await httpRequestsService.fetchData(endpoint, "get");
    final data = jsonDecode(result.body);
    for (var i = 0; i < data.length; i++) {
      var id = data[i]["id"] ?? '';
      var title = data[i]["title"] ?? '';
      var image = data[i]["image"] ?? '';
      var status = data[i]["status"] ?? '';
      var commentsCount = data[i]["commentsCount"] ?? '';
      projects.add(ProjectPreview(
          id: id,
          title: title,
          imgUrl: image,
          status: status,
          commentsCount: commentsCount));
    }
    notifyListeners();
  } // index

  Future<void> show(String id) async {
    var endpoint = '${dotenv.env["API_BASE"]}/projects/$id';
    var result = await httpRequestsService.fetchData(endpoint, "method");
    final data = jsonDecode(result.body);
    print(data);
    notifyListeners();
  } // show
}
