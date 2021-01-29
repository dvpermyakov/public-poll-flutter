import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedItem item;
  final GestureTapCallback onTap;

  const FeedItemWidget({Key key, @required this.item, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      alignment: AlignmentDirectional.centerStart,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            item.question,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...item.options
              .map((option) => OptionWidget(
                    option: option,
                  ))
              .toList()
        ],
      ),
    );
    final child =
        onTap != null ? InkWell(onTap: onTap, child: container) : container;
    return Card(color: Colors.white, child: child);
  }
}

class OptionWidget extends StatelessWidget {
  final String option;

  const OptionWidget({Key key, this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 8),
        child: Row(
          children: [_getOptionIndicator(context), _getOptionText()],
        ));
  }

  Widget _getOptionIndicator(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _getOptionText() {
    return Expanded(
      child: Text(
        option,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
