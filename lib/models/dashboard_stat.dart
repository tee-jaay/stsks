import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';

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
    icon: const Icon(Icons.archive),
  ),
  DashboardStat(
    size: 48.0,
    scrWidth: double.infinity,
    scrHeight: 360.0,
    count: '207',
    name: 'Tasks',
    label: 'tasks',
    color: taskColor,
    icon: const Icon(Icons.account_tree),
  ),
  DashboardStat(
    size: 48.0,
    scrWidth: double.infinity,
    scrHeight: 360.0,
    count: '103',
    name: 'Issues',
    label: 'issues',
    color: issueColor,
    icon: const Icon(Icons.list),
  ),
  DashboardStat(
    size: 48.0,
    scrWidth: double.infinity,
    scrHeight: 360.0,
    count: '76',
    name: 'Meetings',
    label: 'meetings',
    color: meetingColor,
    icon: const Icon(Icons.people),
  ),
];
