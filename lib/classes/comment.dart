class Comment {
  final String user;
  final String text;

  Comment({required this.user, required this.text});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      user: json['user'],
      text: json['text'],
    );
  }
}
