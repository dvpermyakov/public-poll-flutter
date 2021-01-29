import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/ratings/User.dart';

class RatingWidgetItem extends StatelessWidget {
  final User user;

  const RatingWidgetItem({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(user.name);
  }

}
