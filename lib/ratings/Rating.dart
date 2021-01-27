import 'package:publicpoll_flutter/ratings/User.dart';

class Rating {
  final List<User> users;

  Rating({this.users});

  factory Rating.fromJson(Map<String, dynamic> json) {
    var usersJson = json["users"] as List<dynamic>;
    var users = usersJson.map((e) => User.fromJson(e)).toList();
    return Rating(users: users);
  }
}
