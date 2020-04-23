import 'package:flutter/material.dart';
import 'package:mobile/ui/screens/events.dart';

import 'main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MyHomePage.routeName:
      return MaterialPageRoute(builder: (context) => MyHomePage());
    case Events.routeName:
      return MaterialPageRoute(builder: (context) => Events());
    default:
      return MaterialPageRoute(builder: (context) => MyHomePage());
  }
}
