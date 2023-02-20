import '../models/project_preview.dart';

int countProjectsByStatus(List<ProjectPreview> items, String status) {
  return items.where((item) => item.status == status).length;
}
