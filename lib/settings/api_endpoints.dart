import 'package:flutter_dotenv/flutter_dotenv.dart';

// Base
final String API_ROOT = dotenv.env["API_BASE"].toString();

// Dashboard
final String DASHBOARD = "$API_ROOT/dashboard";

// Authentication
final String AUTH_SIGN_IN = "$API_ROOT/auth/login";
final String AUTH_SIGN_UP = "$API_ROOT/auth/register";

// Projects
final String PROJECTS_BY_LIMIT = "$API_ROOT/projects-by-limit";
final String PROJECTS = "$API_ROOT/projects";
final String PROJECTS_COMMENTS = "$API_ROOT/projects-comments/projectId";

// Tasks
final String TASKS = "$API_ROOT/projects-tasks/projectId";
final String TASKS_STORE = "$API_ROOT/projects-tasks";
final String TASKS_SHOW = "$API_ROOT/projects-tasks/taskId";
final String TASKS_COMMENTS = "$API_ROOT/projects-tasks-comments";

// Issues
final String ISSUES = "$API_ROOT/projects-issues/projectId";
final String ISSUES_COMMENTS = "$API_ROOT/projects-issues/comments";

// Todos
final String TODOS = "$API_ROOT/projects-tasks-todos/projectId";

// Meetings
final String MEETINGS = "$API_ROOT/projects-meetings/projectId";
final String MEETINGS_COMMENTS = "$API_ROOT/projects-meetings/comments";

// TimeSheets
final String TIMESHEETS = "$API_ROOT/projects-timesheets/projectId";
final String TIMESHEETS_LOG = "$API_ROOT/projects-timesheets/timeSheetId";

// Users
final String USERS = "$API_ROOT/users";
