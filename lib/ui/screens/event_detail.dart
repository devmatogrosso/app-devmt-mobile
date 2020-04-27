import 'package:flutter/material.dart';
import 'package:mobile/ui/components/event_card.dart';
import 'package:mobile/ui/components/person.dart';

class EventDetailArguments {
  @required
  final String title;
  @required
  final String date;
  @required
  final String photoUrl;
  @required
  final String description;
  @required
  final String local;
  // @required final List<Participant> participants;
  // @required final Participant host;

  EventDetailArguments({
    this.title,
    this.date,
    this.photoUrl,
    this.description,
    this.local,
  });
}

class EventDetail extends StatelessWidget {
  static const String routeName = '/EventDetail';

  final EventDetailArguments args;

  final double _infoCardHeight = 60;
  final double participantsSpacing = 30;

  const EventDetail({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: ListView(
        children: [
          EventCard(
            heroTag: "HeroAnim1",
            title: args.title,
            date: args.date,
            photoUrl: args.photoUrl,
            onPressed: () {},
            local: args.local,
            borderRadius: 0,
            infoCardHeight: _infoCardHeight,
            margin: EdgeInsets.all(0),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: _infoCardHeight / 2 + 10,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Descrição", style: Theme.of(context).textTheme.bodyText1),
                SizedBox(height: 10),
                Text(args.description),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10),
                    Text(args.date),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    SizedBox(width: 10),
                    Text("19:00 - 20:00"),
                  ],
                ),
                SizedBox(height: 10),
                Center(child: Text("Host:")),
                // hostImageUrl != null ? Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: ,
                // ) : SizedBox(),
                // Person(
                //   name: "Cloud",
                //   imageRadius: 40,
                // ),
                SizedBox(height: 10),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text("Participantes"),
                  children: <Widget>[
                    Wrap(
                      spacing: participantsSpacing,
                      runSpacing: 7,
                      children: <Widget>[
                        _ParticipantContainer(
                          spacing: participantsSpacing,
                          child: Person(
                            name:
                                "Um nome bem grandao pra ver como fica e se vai bugar",
                          ),
                        ),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "Um nome medio")),
                        _ParticipantContainer(
                          spacing: participantsSpacing,
                          child: Person(
                            name: "teste",
                            photoUrl:
                                "https://d1qmdf3vop2l07.cloudfront.net/azure-candy.cloudvent.net/compressed/_min_/23498a69fae19c60088aff14e974f313.jpg",
                          ),
                        ),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                        _ParticipantContainer(
                            spacing: participantsSpacing,
                            child: Person(name: "teste")),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ParticipantContainer extends StatelessWidget {
  final Widget child;
  final double spacing;

  const _ParticipantContainer({Key key, this.child, this.spacing = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - spacing,
      child: child,
    );
  }
}

// class Host extends StatelessWidget {
//   const Host({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: child,
//     );
//   }
// }
