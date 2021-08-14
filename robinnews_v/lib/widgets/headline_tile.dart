import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(
                  widget.snapshot.data['articles'][widget.index]['source']
                          ['name'] ??
                      'No Name',
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  textScaleFactor: 0.9),
              SizedBox(
                width: 10,
              ),
              Text(
                  Utilities().hoursBetween(
                        DateTime.parse(widget.snapshot.data['articles']
                            [widget.index]['publishedAt']),
                        DateTime.now(),
                      ) ??
                      '0h',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                  textScaleFactor: 0.9),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.snapshot.data['articles'][widget.index]['title'] ??
                'No Title',
            textScaleFactor: 1.2,
            style: GoogleFonts.notoSans(),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.network(
                widget.snapshot.data['articles'][widget.index]['urlToImage'] ??
                    'https://timesofindia.indiatimes.com/photo/85324583/size-547898/85324583.jpg',
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      widget.snapshot.data['articles'][widget.index]
                              ['description'] ??
                          'No Description',
                      textScaleFactor: 0.95,
                      style: GoogleFonts.oxygen(),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.snapshot.data['articles'][widget.index]
                              ['author'] ??
                          'No Author',
                      style: GoogleFonts.lato(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.8,
        )
      ],
    );
  }
}
