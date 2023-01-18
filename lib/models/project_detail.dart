class ProjectDetail{
  String id;
  String title;
  String image;
  String status;
  String commentsCount;
  String slug;
  String createdBy;
  String description;
  String repoLink;
  String urlOne;
  String urlTwo;
  String estimate;
  String spent;
  String createdAt;
  String updatedAt;
  List<dynamic> assignees;
  List<dynamic> comments;

  ProjectDetail({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.commentsCount,
    required this.slug,
    required this.createdBy,
    required this.description,
    required this.repoLink,
    required this.urlOne,
    required this.urlTwo,
    required this.estimate,
    required this.spent,
    required this.createdAt,
    required this.updatedAt,
    required this.assignees,
    required this.comments,
  });
}