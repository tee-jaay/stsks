class StatData {
  final String name;
  final String count;

  StatData({
    required this.name,
    required this.count,
  });
}

class RecentProject {
  final String id;
  final String title;
  final String status;

  RecentProject({
    required this.id,
    required this.title,
    required this.status,
  });
}

class LatestOpenIssues {
  final String id;
  final String projectId;
  final String createdBy;
  final String title;
  final String status;
  final String type;
  final String severity;
  final String createdAt;

  LatestOpenIssues({
    required this.id,
    required this.projectId,
    required this.createdBy,
    required this.title,
    required this.status,
    required this.type,
    required this.severity,
    required this.createdAt,
  });
}

class TasksCountByPriority {
  final String id;
  final int count;

  TasksCountByPriority({
    required this.id,
    required this.count,
  });
}

class UsersOnline {
  final String id;
  final String name;
  final String roleType;
  final String profileAvatar;

  UsersOnline({
    required this.id,
    required this.name,
    required this.roleType,
    required this.profileAvatar,
  });
}

