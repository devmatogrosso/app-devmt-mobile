import 'package:flutter/material.dart';
import 'package:mobile/ui/screens/events.dart';

import './router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevMT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFe64c3b)),
      home: MyHomePage(title: 'DevMT'),
      onGenerateRoute: router.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/Home';

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Events.routeName,
              );
            },
            child: Text("Eventos"),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
