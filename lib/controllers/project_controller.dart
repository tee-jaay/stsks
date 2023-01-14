import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProjectController with ChangeNotifier{
  void fetchProjects() async {
    var uri = Uri.parse('${dotenv.env["API_BASE"]}/projects-by-limit/6');
    var response = await http.get(
      uri,
      headers: {

      },
    );
    print("------------ response ------------");
    print(response.statusCode);
    print(response.body);
    print("------------ response ------------");
  }
}