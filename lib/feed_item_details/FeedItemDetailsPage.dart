import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed/FeedItemWidget.dart';

class FeedItemDetailsPage extends StatelessWidget {
  final FeedItem item;

  const FeedItemDetailsPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.question),
        ),
        body: ListView(
          children: [FeedItemWidget(item: item, onTap: null)],
        ));
  }
}
