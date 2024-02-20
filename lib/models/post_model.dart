class Post {
  String fullName;
  String content;
  String date;
  String? userId;
  String? imageUrl; // Add this line

  Post({
    required this.fullName,
    required this.content,
    required this.date,
    this.userId,
    this.imageUrl, // Add this line
  });

  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        fullName = json['fullName'],
        date = json['date'],
        content = json['content'],
        imageUrl = json['imageUrl'];
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullName,
      'content': content,
      'date': date,
      'userId': userId,
      'imageUrl': imageUrl, // Add this line
    };
  }
}
