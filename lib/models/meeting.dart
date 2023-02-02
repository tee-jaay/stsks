class Meeting {
  String id;
  String projectId;
  String createdBy;
  String title;
  String bookmark;
  String status;
  String date;
  String time;
  String duration;
  String agenda;
  String location;
  String address;
  String phone;
  List<dynamic> comments;

  Meeting({
    required this.id,
    required this.projectId,
    required this.createdBy,
    required this.title,
    required this.bookmark,
    required this.status,
    required this.date,
    required this.time,
    required this.duration,
    required this.agenda,
    required this.location,
    required this.address,
    required this.phone,
    required this.comments,
  });
}
