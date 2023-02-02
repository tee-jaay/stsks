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
