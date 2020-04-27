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

/// A Widget that displays an image and some info in a card. The card is displayed above the image, and goes a little bit below it.
/// The distance that the card goes below the image is half of the [infoCardHeight] value, so make sure you have enough space below
/// this widget so you don't end up having overllaping widgets.
class EventCard extends StatelessWidget {
  final String title;

  /// Expecting date in a YYYY-MM-DD format
  final String date;
  final String photoUrl;
  final String local;
  final String heroTag;
  final int quantity;
  final double borderRadius;
  final double infoCardHeight;
  final void Function() onPressed;

  /// The info card goes half of the info card's height below the image card, so its better to have a vertical margin equal or
  /// greater than that value so it doesn't overlap.
  final EdgeInsets margin;

  final double _verticalSeparatorHeight = 7;

  const EventCard({
    Key key,
    @required this.title,
    @required this.date,
    this.photoUrl,
    @required this.local,
    @required this.heroTag,
    this.quantity,
    this.borderRadius = 10,
    @required this.onPressed,
    this.infoCardHeight = 60,
    this.margin = const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> dateList = date.split("-");
    return GestureDetector(
      onTap: onPressed,
      child: Hero(
        tag: heroTag,
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
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
        ),
      ),
    );
  }
}
