import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project_1/models/post_model.dart';

class RealTimeDataBase {
  static final _database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addPost(Post post) async {
    await _database.child("posts").push().set(post.toJson());
    return _database.onChildAdded;
  }

  static Future<List<Post>> getPosts() async {
    List<Post> items = [];
    Query _query = _database.child("posts");
    DatabaseEvent event = await _query.once();
    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          fullName: map['fullname'],
          content: map['content'],
          date: map['date'],
          userId: map['userId'],
          imageUrl: map['imageUrl']); 
      items.add(post);
    }
    return items;
  }
}
