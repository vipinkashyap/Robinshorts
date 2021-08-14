import 'package:flutter/material.dart';
import 'package:robinnews_v/shared/utilities.dart';

class HeadLineTile extends StatefulWidget {
  final AsyncSnapshot snapshot;
  final int index;

  HeadLineTile({
    required this.snapshot,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _HeadLineTileState createState() => _HeadLineTileState();
}

class _HeadLineTileState extends State<HeadLineTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(
                widget.snapshot.data['articles'][widget.index]['source']
                    ['name'],
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Utilities().hoursBetween(
                  DateTime.parse(widget.snapshot.data['articles'][widget.index]
                      ['publishedAt']),
                  DateTime.now(),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.snapshot.data['articles'][widget.index]['title'],
          ),
        ),
        Image.network(
          widget.snapshot.data['articles'][widget.index]['urlToImage'],
        ),
        Divider(
          color: Colors.blueGrey,
          thickness: 1.2,
        )
      ],
    );
  }
}
