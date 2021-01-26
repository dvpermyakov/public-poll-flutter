import 'package:flutter/material.dart';

class FeedAddNewItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new poll"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Question"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Option 1"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Option 2"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
