import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed/FeedPage.dart';
import 'package:publicpoll_flutter/feed/FeedWidget.dart';

class FeedState extends State<FeedPage> {
  var _items = <FeedItem>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
      ),
      body: ListView(
        children: _items.map((item) => FeedWidget(item: item)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }

  void _addItem() {
    setState(() {
      _items.add(FeedItem("Question?", ["fist", "second"]));
    });
  }
}
