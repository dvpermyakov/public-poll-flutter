import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:publicpoll_flutter/ratings/Rating.dart';

class RatingsRepository {
  Future<Rating> loadRating() async {
    final url = "https://history-quiz-app.appspot.com/api/rating/list";
    log("url = $url");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final rating = Rating.fromJson(json);
      await _saveToFile(response.body);
      return rating;
    } else {
      final json = jsonDecode(await _getJsonFromFile());
      final rating = Rating.fromJson(json);
      return rating;
    }
  }

  Future<String> _getFilePath() async {
    final path = await getApplicationDocumentsDirectory();
    return "${path.path}/rating";
  }

  Future<File> _saveToFile(String json) async {
    final file = File(await _getFilePath());
    return file.writeAsString(json);
  }

  Future<String> _getJsonFromFile() async {
    final file = File(await _getFilePath());
    return file.readAsString();
  }
}
