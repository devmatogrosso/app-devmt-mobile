import 'package:flutter/material.dart';
import 'package:mobile/ui/components/event_card.dart';

class Events extends StatelessWidget {
  static const routeName = "/Events";

  const Events({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          EventCard(
            title: "Teste 1",
            date: "2020-04-01",
            photoUrl:
                "https://www.petz.com.br/blog/wp-content/uploads/2019/04/parto-de-cachorro-1.jpg",
            local: "Arena Pantanal",
            onPressed: () {},
          ),
          EventCard(
            title: "Teste 2",
            date: "2020-05-03",
            local: "Arena Pantanal",
            onPressed: () {},
          ),
          EventCard(
            title: "Teste 2",
            date: "2020-05-03",
            local: "Arena Pantanal",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
