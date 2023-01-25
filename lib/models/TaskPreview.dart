class TaskPreview {
  String id;
  String projectId;
  String createdBy;
  String title;
  String status;
  String plannedStart;
  String plannedEnd;
  String priority;

  TaskPreview({
    required this.id,
    required this.projectId,
    required this.createdBy,
    required this.title,
    required this.status,
    required this.plannedStart,
    required this.plannedEnd,
    required this.priority,
  });
}
