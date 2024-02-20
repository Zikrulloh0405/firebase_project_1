class Post {
  int? id;
  String? fullName;
  String? content;
  String? date;
  String? userId;

  Post({this.id, this.fullName, this.date, this.userId, this.content});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        date = json['date'],
        userId = json['userId'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'date' : date,
        'userId': userId,
        'content': content,
      };
}