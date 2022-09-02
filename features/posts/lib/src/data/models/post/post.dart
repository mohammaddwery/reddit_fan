class Post {
  String authorName;
  String body;
  int commentsCount;
  DateTime publishedAt;
  Post({
    required this.authorName,
    required this.body,
    required this.commentsCount,
    required this.publishedAt,
  });
}