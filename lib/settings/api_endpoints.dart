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

// Issues

// Todos

// TimeSheets

// Meetings

// Users
final String USERS = "$API_ROOT/users";
