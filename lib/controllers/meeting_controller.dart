import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/meeting.dart';
import '../settings/api_endpoints.dart';
import '../services/http_requests_service.dart';

class MeetingController extends HttpRequestsService with ChangeNotifier {
  late List<Meeting> meetingsList = [];

  Future<void> index(
      {required String projectId, required String accessToken}) async {
    var result = await requestApi(
        endpoint: '$MEETINGS/$projectId',
        object: {},
        reqMethod: 'GET',
        accessToken: accessToken);
    if(result.statusCode == 200){
      clearMeetings();
      var data = jsonDecode(result.body);
      for (var i = 0; i < data.length; i++) {
        String id = data[i]["id"] ?? '';
        String projectId = data[i]["projectId"] ?? '';
        String createdBy = data[i]["createdBy"] ?? '';
        String title = data[i]["title"] ?? '';
        String bookmark = data[i]["bookmark"] ?? '';
        String status = data[i]["status"] ?? '';
        String date = data[i]["date"] ?? '';
        String time = data[i]["time"] ?? '';
        String duration = data[i]["duration"] ?? '';
        String agenda = data[i]["agenda"] ?? '';
        String location = data[i]["location"] ?? '';
        String address = data[i]["address"] ?? '';
        String phone = data[i]["phone"] ?? '';
        List<dynamic> comments = data[i]["comments"] ?? '';

        meetingsList.add(Meeting(
            id: id,
            projectId: projectId,
            createdBy: createdBy,
            title: title,
            bookmark: bookmark,
            status: status,
            date: date,
            time: time,
            duration: duration,
            agenda: agenda,
            location: location,
            address: address,
            phone: phone,
            comments: comments));
      }
    }
    notifyListeners();
  }

  Future<int> store({required String projectId, required String accessToken, required Object newObj}) async{
    var result = await requestApi(
    endpoint: '$MEETINGS/$projectId',
    object: newObj,
    reqMethod: "POST",
    accessToken: accessToken);
    return result.statusCode;
  }

  Future<int> messageAdd({required String meetingId, required String accessToken, required Object newObj}) async{
    var result = await requestApi(
    endpoint: '$MEETINGS_COMMENTS/$meetingId',
    object: newObj,
    reqMethod: "PATCH",
    accessToken: accessToken);
    return result.statusCode;
  }

  void clearMeetings(){
    meetingsList.clear();
  }
}
