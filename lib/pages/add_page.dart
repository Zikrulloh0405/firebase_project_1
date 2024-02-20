import 'package:firebase_project_1/services/auth_service.dart';
import 'package:firebase_project_1/services/real_time_database.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class AddPage extends StatefulWidget {
  static String id = "AddPage";
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contentController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  _createPost() {
    String fullName = _firstNameController.text + _lastNameController.text;
    String date = _dateController.text.toString();
    String content = _contentController.text.toString();

    if (fullName.isEmpty || date.isEmpty || content.isEmpty) return;

    _apiCreatePost(fullName, date, content);
  }

  _apiCreatePost(String fullName, String date, String content) {
    setState(() {
      isLoading = true;
    });
    var post = Post(
      fullName: fullName,
      date: date,
      content: content,
    );
    RealTimeDataBase.addPost(post).then((value) => {
          _resAddPost(),
        });
  }

  _resAddPost() {
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop({'data': 'done'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'FirstName',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: 'LastName',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                hintText: 'Content',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                hintText: 'Date',
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: MaterialButton(
                minWidth: double.infinity,
                color: Colors.amber,
                onPressed: () {
                  _createPost();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
