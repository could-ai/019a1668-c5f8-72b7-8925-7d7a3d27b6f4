class Post {
  final String id;
  final String content;
  int likes;
  bool isLiked;

  Post({
    required this.id,
    required this.content,
    required this.likes,
    required this.isLiked,
  });
}