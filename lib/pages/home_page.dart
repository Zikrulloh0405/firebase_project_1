import 'package:firebase_project_1/models/post_model.dart';
import 'package:firebase_project_1/pages/add_page.dart';
import 'package:firebase_project_1/services/real_time_database.dart';
import 'package:firebase_project_1/widgets/all_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _listOfPost = [];

  Future _callCreatePage() async {
    Map results = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return AddPage();
    }));
    if (results != null && results.containsKey("data")) {
      print(results['data']);
      _apiPostList();
    }
  }

  _apiPostList() async {
    var list = await RealTimeDataBase.getPosts();
    _listOfPost.clear();
    setState(() {
      _listOfPost = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: textWidget(textInput: 'All Posts'),
        centerTitle: true,
      ),
      body: ListView.builder(
  itemCount: _listOfPost.length,
  itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _listOfPost[index].imageUrl != null
              ? Image.network(_listOfPost[index].imageUrl!, width: double.infinity)
              : SizedBox(), 
          ListTile(
            title: textWidget(textInput: '${_listOfPost[index].fullName}'),
            subtitle: textWidget(textInput: '${_listOfPost[index].content}'),
            trailing: textWidget(textInput: '${_listOfPost[index].date}'),
          ),
        ],
      ),
    );
  },
),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
