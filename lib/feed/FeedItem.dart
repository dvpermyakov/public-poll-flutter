import 'package:flutter/widgets.dart';

class FeedItem {
  String question;
  List<String> options;

  FeedItem({@required this.question, @required this.options});

  FeedItem.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        options = (json['options'] as List<dynamic>).cast<String>();

  Map<String, dynamic> toJson() => {
        'question': question,
        'options': options,
      };
}
