import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:publicpoll_flutter/feed/FeedPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Navigator(
          pages: [MaterialPage(key: ValueKey('FeedPage'), child: FeedPage())],
          onPopPage: (route, result) => route.didPop(result),
        ));
  }
}
