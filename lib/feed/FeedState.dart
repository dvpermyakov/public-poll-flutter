import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed/FeedItemWidget.dart';
import 'package:publicpoll_flutter/feed/FeedPage.dart';
import 'package:publicpoll_flutter/feed_add_new_item/FeedAddNewItemPage.dart';
import 'package:publicpoll_flutter/feed_item_details/FeedItemDetailsPage.dart';

class FeedState extends State<FeedPage> {
  var _items = <FeedItem>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
        ),
        body: ListView(
          children: _items
              .map((item) => FeedItemWidget(
                  item: item,
                  onTap: () {
                    Navigator.push(context, _getItemDetailsRoute(item));
                  }))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, _getAddNewItemRouter());
            }));
  }

  Route<void> _getItemDetailsRoute(FeedItem item) {
    return MaterialPageRoute<void>(
        builder: (BuildContext context) => FeedItemDetailsPage(item: item));
  }

  Route<FeedItem> _getAddNewItemRouter() {
    return MaterialPageRoute<FeedItem>(
        builder: (BuildContext context) => FeedAddNewItemPage());
  }
}
