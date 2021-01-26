import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed_add_new_item/FeedAddNewItemPage.dart';

class FeedAddNewItemState extends State<FeedAddNewItemPage> {
  final _key = GlobalKey<FormState>();
  var _question = "";
  var _option1 = "";
  var _option2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new poll"),
      ),
      body: Form(
          key: _key,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Question"),
                onChanged: (value) {
                  _question = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fulfill question!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Option 1"),
                onChanged: (value) {
                  _option1 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fulfill option 1!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Option 2"),
                onChanged: (value) {
                  _option2 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fulfill option 2!';
                  }
                  return null;
                },
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _onAdd,
      ),
    );
  }

  _onAdd() {
    final state = _key.currentState;
    if (state.validate()) {
      final item = FeedItem(question: _question, options: [_option1, _option2]);
      Navigator.pop(context, item);
    }
  }
}
