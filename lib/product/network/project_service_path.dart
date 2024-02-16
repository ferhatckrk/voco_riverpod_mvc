enum ProjectNetworkPath {
  login("api/login"),
  users("/api/users?page="),
  ;

  final String path;
  const ProjectNetworkPath(this.path);

  String withQuery(String value) {
    return '$path/$value';
  }
}
