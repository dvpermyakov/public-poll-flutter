import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed/FeedItemWidget.dart';
import 'package:publicpoll_flutter/feed/FeedPage.dart';
import 'package:publicpoll_flutter/feed/FeedRepository.dart';
import 'package:publicpoll_flutter/feed_add_new_item/FeedAddNewItemPage.dart';
import 'package:publicpoll_flutter/feed_item_details/FeedItemDetailsPage.dart';
import 'package:publicpoll_flutter/ratings/RatingPage.dart';

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
          title: Text(AppLocalizations.of(context).feed),
          actions: [
            IconButton(icon: Icon(Icons.person), onPressed: _onRatingClick)
          ],
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/poll.png"),
                        width: 48,
                        height: 48,
                      ),
                      Text((AppLocalizations.of(context).newestPolls),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24))
                    ],
                  )),
              ..._items
                  .map((item) => FeedItemWidget(
                      item: item, onTap: () => {_onItemTap(item)}))
                  .toList()
            ]),
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

  _onRatingClick() {
    Navigator.push(context, _getRatingRoute());
  }

  Route<void> _getItemDetailsRoute(FeedItem item) {
    return MaterialPageRoute<void>(
        builder: (context) => FeedItemDetailsPage(item: item));
  }

  Route<FeedItem> _getAddNewItemRouter() {
    return MaterialPageRoute<FeedItem>(
        builder: (context) => FeedAddNewItemPage());
  }

  Route<void> _getRatingRoute() {
    return MaterialPageRoute(builder: (context) => RatingPage());
  }
}
