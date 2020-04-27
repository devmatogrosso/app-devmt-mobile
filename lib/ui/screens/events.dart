import 'package:flutter/material.dart';
import 'package:mobile/ui/components/event_card.dart';
import 'package:mobile/ui/screens/event_detail.dart';

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
            heroTag: "HeroAnim1",
            title: "Teste 1",
            date: "2020-04-01",
            photoUrl:
                "https://www.petz.com.br/blog/wp-content/uploads/2019/04/parto-de-cachorro-1.jpg",
            local: "Arena Pantanal",
            onPressed: () {
              Navigator.pushNamed(
                context,
                EventDetail.routeName,
                arguments: EventDetailArguments(
                    title: "Teste 1",
                    date: "2020-04-01",
                    photoUrl:
                        "https://www.petz.com.br/blog/wp-content/uploads/2019/04/parto-de-cachorro-1.jpg",
                    local: "Arena Pantanal",
                    description:
                        "Texto aleatorio com palavras que vem na minha cabeca para poder ter um texto de tamanho suficiente e conseguir ver como ficaria a descricao disso"),
              );
            },
          ),
          EventCard(
            heroTag: "HeroAnim2",
            title: "Teste 2",
            date: "2020-05-03",
            local: "Arena Pantanal",
            onPressed: () {},
          ),
          EventCard(
            heroTag: "HeroAnim3",
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
