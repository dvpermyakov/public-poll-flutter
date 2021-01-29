import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/ratings/Rating.dart';
import 'package:publicpoll_flutter/ratings/RatingPage.dart';
import 'package:publicpoll_flutter/ratings/RatingRepository.dart';
import 'package:publicpoll_flutter/ratings/RatingWidgetItem.dart';

enum _RatingUIState { loading, loaded, error }

class RatingState extends State<RatingPage> {
  final RatingsRepository repository = RatingsRepository();

  var _uiState = _RatingUIState.loading;
  var _rating = Rating(users: []);

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rating"),
        ),
        body: _getBody());
  }

  Widget _getBody() {
    Widget body;
    switch (_uiState) {
      case _RatingUIState.loading:
        body = Center(child: CircularProgressIndicator());
        break;
      case _RatingUIState.loaded:
        body = ListView(
            children: _rating.users
                .map((user) => RatingWidgetItem(user: user))
                .toList());
        break;
      case _RatingUIState.error:
        body = Center(child: Text("Something went wrong!"));
        break;
    }
    return body;
  }

  _loadRating() async {
    repository.loadRating().then((value) {
      setState(() {
        _rating = value;
        _uiState = _RatingUIState.loaded;
      });
    }).catchError((e, trace) {
      log(e.toString());
      setState(() {
        _uiState = _RatingUIState.error;
      });
    });
  }
}
