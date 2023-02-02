class Task {
  String id;
  String projectId;
  String createdBy;
  String title;
  String description;
  String bookmark;
  String status;
  String plannedStart;
  String plannedEnd;
  String actualStart;
  String actualEnd;
  String priority;
  String color;
  String month;
  String year;

  Task({
    required this.id,
    required this.projectId,
    required this.createdBy,
    required this.title,
    required this.description,
    required this.bookmark,
    required this.status,
    required this.plannedStart,
    required this.plannedEnd,
    required this.actualStart,
    required this.actualEnd,
    required this.priority,
    required this.color,
    required this.month,
    required this.year,
  });
}
