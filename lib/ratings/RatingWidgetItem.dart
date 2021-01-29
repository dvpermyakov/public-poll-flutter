import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/ratings/User.dart';

class RatingWidgetItem extends StatelessWidget {
  final User user;

  const RatingWidgetItem({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(children: [
              _getImage(context),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(user.name,
                          maxLines: 3,
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis)))
            ])));
  }

  Widget _getImage(BuildContext context) {
    Color _getColor(BuildContext context) {
      return Theme.of(context).primaryColor;
    }

    Widget _getImage() {
      return Container(
          width: 64,
          height: 64,
          child: Image.network(user.image, fit: BoxFit.cover));
    }

    Widget _getIcon() {
      return Container(
        decoration: ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(width: 4, color: _getColor(context)))),
        width: 64,
        height: 64,
        child: Icon(Icons.person, size: 32, color: _getColor(context)),
      );
    }

    final child = user.image != null ? _getImage() : _getIcon();
    return ClipRRect(borderRadius: BorderRadius.circular(32), child: child);
  }
}
