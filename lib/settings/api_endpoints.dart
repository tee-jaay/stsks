import 'package:flutter_dotenv/flutter_dotenv.dart';

// Base
final String API_ROOT = dotenv.env["API_BASE"].toString();
// Authentication
final String AUTH_SIGN_IN = "$API_ROOT/auth/login";
final String AUTH_SIGN_UP = "$API_ROOT/auth/register";

// Projects
final String PROJECTS_BY_LIMIT = "$API_ROOT/projects-by-limit";
final String PROJECTS = "$API_ROOT/projects";

// Tasks
final String TASKS = "$API_ROOT/projects-tasks/projectId";
final String TASKS_STORE = "$API_ROOT/projects-tasks";
final String TASKS_SHOW = "$API_ROOT/projects-tasks/taskId";

// Issues
final String ISSUES = "$API_ROOT/projects-issues/projectId";

// Todos
final String TODOS = "$API_ROOT/projects-tasks-todos/projectId";

// Meetings
final String MEETINGS = "$API_ROOT/projects-meetings/projectId";

// TimeSheets
final String TIMESHEETS = "$API_ROOT/projects-timesheets/projectId";

// Users
final String USERS = "$API_ROOT/users";
