import 'package:flutter/material.dart';
import 'package:mobile/ui/screens/event_detail.dart';
import 'package:mobile/ui/screens/events.dart';

import 'main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MyHomePage.routeName:
      return MaterialPageRoute(builder: (context) => MyHomePage());
    case Events.routeName:
      return MaterialPageRoute(builder: (context) => Events());
    case EventDetail.routeName:
      return MaterialPageRoute(
          builder: (context) => EventDetail(args: settings.arguments));
    default:
      return MaterialPageRoute(builder: (context) => MyHomePage());
  }
}
