import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed/FeedItemWidget.dart';
import 'package:publicpoll_flutter/feed/FeedPage.dart';
import 'package:publicpoll_flutter/feed/FeedRepository.dart';
import 'package:publicpoll_flutter/feed_add_new_item/FeedAddNewItemPage.dart';
import 'package:publicpoll_flutter/feed_item_details/FeedItemDetailsPage.dart';

class FeedState extends State<FeedPage> {
  final FeedRepository repository = FeedRepository();
  var _items = <FeedItem>[];

  @override
  void initState() {
    super.initState();
    _loadFeedItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
        ),
        body: ListView(
          children: _items
              .map((item) =>
                  FeedItemWidget(item: item, onTap: () => {_onItemTap(item)}))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: _onAddButton));
  }

  _loadFeedItems() async {
    var items = await repository.getFeedItems();
    setState(() {
      _items = items;
    });
  }

  _onItemTap(FeedItem item) {
    Navigator.push(context, _getItemDetailsRoute(item));
  }

  _onAddButton() async {
    final item = await Navigator.push(context, _getAddNewItemRouter());
    if (item != null) {
      setState(() {
        _items.add(item);
      });
      repository.setFeedItems(_items);
    }
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
