import 'package:firebase_project_1/widgets/all_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: textWidget(textInput: 'All Posts'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: textWidget(textInput: 'textInput'),
              subtitle: textWidget(textInput: 'textInput'),
              trailing: textWidget(textInput: 'textInput'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
        child: iconWidget(inputIcon: Icons.add),
      ),
    );
  }

  
}
