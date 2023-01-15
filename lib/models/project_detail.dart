class ProjectDetail{
  String id;
  String title;
  String image;
  String status;
  int commentsCount;
  String slug;
  String createdBy;
  String description;
  String repoLink;
  String urlOne;
  String urlTwo;

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
  });
}