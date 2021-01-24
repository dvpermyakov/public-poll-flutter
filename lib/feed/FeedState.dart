import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed/FeedPage.dart';

class FeedState extends State<FeedPage> {
  var items = <FeedItem>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: items.map((e) => Text(e.question)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }

  void _addItem() {
    setState(() {
      items.add(FeedItem("Question", []));
    });
  }
}
