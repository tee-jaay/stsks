class TimeSheet {
  String id;
  String projectId;
  String taskId;
  String task;
  String createdBy;
  String title;
  List<dynamic> logs = [];

  TimeSheet({
    required this.id,
    required this.projectId,
    required this.taskId,
    required this.task,
    required this.createdBy,
    required this.title,
    required this.logs,
  });
}
