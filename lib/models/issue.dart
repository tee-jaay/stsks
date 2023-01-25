class Issue {
  String id;
  String taskId;
  String projectId;
  String createdBy;
  String title;
  String description;
  String bookmark;
  String status;
  String start;
  String end;
  String priority;
  String type;
  String severity;
  List<dynamic> comments = [];

  Issue({
    required this.id,
    required this.taskId,
    required this.projectId,
    required this.createdBy,
    required this.title,
    required this.description,
    required this.bookmark,
    required this.status,
    required this.start,
    required this.end,
    required this.priority,
    required this.type,
    required this.severity,
    required this.comments,
  });
}
