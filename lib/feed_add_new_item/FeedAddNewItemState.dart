import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:publicpoll_flutter/feed/FeedItem.dart';
import 'package:publicpoll_flutter/feed_add_new_item/FeedAddNewItemPage.dart';

class FeedAddNewItemState extends State<FeedAddNewItemPage> {
  final _key = GlobalKey<FormState>();
  var _question = "";
  var _option1 = "";
  var _option2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).createNewPoll),
      ),
      body: Form(
          key: _key,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).questionHint),
                onChanged: (value) {
                  _question = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return AppLocalizations.of(context).questionError;
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).option1Hint),
                onChanged: (value) {
                  _option1 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return AppLocalizations.of(context).option1Error;
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).option1Hint),
                onChanged: (value) {
                  _option2 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return AppLocalizations.of(context).option2Error;
                  }
                  return null;
                },
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _onAdd,
      ),
    );
  }

  _onAdd() {
    final state = _key.currentState;
    if (state.validate()) {
      final item = FeedItem(question: _question, options: [_option1, _option2]);
      Navigator.pop(context, item);
    }
  }
}
