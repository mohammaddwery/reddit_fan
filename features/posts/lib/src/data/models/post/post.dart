class Post {
  String authorName;
  String name;
  String id;
  String body;
  int commentsCount;
  DateTime publishedAt;
  Post({
    required this.authorName,
    required this.name,
    required this.id,
    required this.body,
    required this.commentsCount,
    required this.publishedAt,
  });
}