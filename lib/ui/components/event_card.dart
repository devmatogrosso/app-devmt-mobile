import 'package:flutter/material.dart';

const _months = <String>[
  "JAN",
  "FEV",
  "MAR",
  "ABR",
  "MAI",
  "JUN",
  "JUL",
  "AGO",
  "SET",
  "OUT",
  "NOV",
  "DEZ",
];

class EventCard extends StatelessWidget {
  final String title;
  final int quantity;
  final String local;

  /// Expecting date in a YYYY-MM-DD format
  final String date;
  final String photoUrl;
  final void Function() onPressed;

  /// The info card goes half of the info card's height below the image card, so its better to have a vertical margin equal or greater than that value so it doenst overlap.
  final EdgeInsets margin;
  final double infoCardHeight;

  final double _verticalSeparatorHeight = 7;

  const EventCard({
    Key key,
    @required this.title,
    @required this.date,
    @required this.onPressed,
    this.quantity,
    @required this.local,
    this.photoUrl,
    this.infoCardHeight = 60,
    this.margin = const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> dateList = date.split("-");
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 5,
        //     spreadRadius: 0.1,
        //     offset: Offset(
        //       10,
        //       10,
        //     ),
        //   )
        // ],
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.grey,
              child: photoUrl != null
                  ? Image.network(
                      photoUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    )
                  : SizedBox(),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: -infoCardHeight / 2,
            child: Container(
              // height: infoCardHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        dateList[2],
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        _months[int.tryParse(dateList[1]) - 1] +
                            "/" +
                            dateList[0],
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: _verticalSeparatorHeight, horizontal: 5),
                    height: infoCardHeight - _verticalSeparatorHeight * 2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.25, color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          local,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      Text(quantity.toString()),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
