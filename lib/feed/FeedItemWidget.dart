import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedItem item;

  const FeedItemWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          children: [
            Text(
              item.question,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...item.options
                .map((option) => OptionWidget(
                      option: option,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String option;

  const OptionWidget({Key key, this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        Text(option)
      ],
    );
  }
}
