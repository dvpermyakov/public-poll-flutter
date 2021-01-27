import 'dart:convert';

import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedRepository {
  final _key = "feed_items_key";

  const FeedRepository();

  Future<List<FeedItem>> getFeedItems() async {
    var pref = await SharedPreferences.getInstance();
    var jsonItems = pref.getStringList(_key);
    if (jsonItems != null) {
      var items = jsonItems.map(_decode).toList();
      return Future.value(items);
    } else {
      return Future.value([]);
    }
  }

  setFeedItems(List<FeedItem> items) async {
    final pref = await SharedPreferences.getInstance();
    pref.setStringList(_key, items.map(_encode).toList());
  }

  String _encode(FeedItem item) {
    return jsonEncode(item);
  }

  FeedItem _decode(String json) {
    Map itemMap = jsonDecode(json);
    return FeedItem.fromJson(itemMap);
  }
}
