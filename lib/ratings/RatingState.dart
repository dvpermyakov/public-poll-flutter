import 'package:flutter/material.dart';
import 'package:publicpoll_flutter/ratings/Rating.dart';
import 'package:publicpoll_flutter/ratings/RatingPage.dart';
import 'package:publicpoll_flutter/ratings/RatingRepository.dart';

enum _RatingUIState { loading, loaded, error }

class RatingState extends State<RatingPage> {
  final RatingsRepository repository = RatingsRepository();

  var _uiState = _RatingUIState.loading;
  var rating = Rating(users: []);

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
        body = Text("loading");
        break;
      case _RatingUIState.loaded:
        body = ListView(
            children: rating.users.map((user) => Text(user.name)).toList());
        break;
      case _RatingUIState.error:
        body = Text("error");
        break;
    }
    return body;
  }

  _loadRating() async {
    final rating = await repository.loadRating();
    setState(() {
      this.rating = rating;
      _uiState = _RatingUIState.loaded;
    });
  }
}
