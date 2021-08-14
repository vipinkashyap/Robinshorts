import 'package:flutter/material.dart';

class HeadLineTile extends StatefulWidget {
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final int index;

  HeadLineTile({
    required this.context,
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
          child: Text(
            widget.snapshot.data['articles'][widget.index]['source']['name'],
          ),
        ),
        Text(
          widget.snapshot.data['articles'][widget.index]['title'],
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
