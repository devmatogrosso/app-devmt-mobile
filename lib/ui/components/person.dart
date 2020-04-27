import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  final String photoUrl;
  final String name;
  final double imageRadius;
  final int maxLines;

  const Person({
    Key key,
    this.photoUrl,
    this.name,
    this.imageRadius = 20,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
          radius: imageRadius,
        ),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
