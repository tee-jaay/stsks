import 'package:flutter/material.dart';
import '../settings/constants.dart';

double iconSize = 80.0;

class DashboardStat {
  final String count, name, label;
  final double size, scrWidth, scrHeight;
  Color color;
  Icon icon;

  DashboardStat({
    required this.size,
    required this.scrWidth,
    required this.scrHeight,
    required this.count,
    required this.name,
    required this.label,
    required this.color,
    required this.icon,
  });
}

List<DashboardStat> dashboardStats = [
  DashboardStat(
    size: 48.0,
    scrWidth: double.infinity,
    scrHeight: 360.0,
    count: '45',
    name: 'Projects',
    label: 'projects',
    color: projectColor,
    icon: Icon(
      Icons.archive,
      size: iconSize,
      color: projectColor,
    ),
  ),
  DashboardStat(
    size: 48.0,
    scrWidth: double.infinity,
    scrHeight: 360.0,
    count: '207',
    name: 'Tasks',
    label: 'tasks',
    color: taskColor,
    icon: Icon(
      Icons.account_tree,
      size: iconSize,
      color: taskColor,
    ),
  ),
  DashboardStat(
    size: 48.0,
    scrWidth: double.infinity,
    scrHeight: 360.0,
    count: '103',
    name: 'Issues',
    label: 'issues',
    color: issueColor,
    icon: Icon(
      Icons.list,
      size: iconSize,
      color: issueColor,
    ),
  ),
  DashboardStat(
    size: 48.0,
    scrWidth: double.infinity,
    scrHeight: 360.0,
    count: '76',
    name: 'Meetings',
    label: 'meetings',
    color: meetingColor,
    icon: Icon(
      Icons.people,
      size: iconSize,
      color: meetingColor,
    ),
  ),
];

class StatData {
  final String today;
  final String allProjectsCount;
  final String allTasksCount;
  final String allIssuesCount;
  final String allMeetingsCount;

  StatData({
    required this.today,
    required this.allProjectsCount,
    required this.allTasksCount,
    required this.allIssuesCount,
    required this.allMeetingsCount,
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

