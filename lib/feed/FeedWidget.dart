import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';

class FeedWidget extends StatelessWidget {
  final FeedItem item;

  const FeedWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(32),
        child: Text(item.question),
      ),
    );
  }
}
