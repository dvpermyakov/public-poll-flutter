import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:publicpoll_flutter/ratings/Rating.dart';

class RatingsRepository {
  Future<Rating> loadRating() async {
    final url = "https://history-quiz-app.appspot.com/api/rating/list";
    log("url = $url");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Rating.fromJson(json);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
