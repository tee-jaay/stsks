class User {
  String id;
  String username;
  String accessToken;
  bool isAuthenticated;

  User(
      {required this.id,
      required this.username,
      required this.accessToken,
      required this.isAuthenticated});
}
