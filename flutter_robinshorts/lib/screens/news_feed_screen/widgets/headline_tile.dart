import 'package:flutter/material.dart';
import 'package:flutter_robinshorts/models/article.dart';
import 'package:flutter_robinshorts/utilities/utilities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeadLineTile extends StatefulWidget {
  final Article article;

  const HeadLineTile({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  HeadLineTileState createState() => HeadLineTileState();
}

class HeadLineTileState extends State<HeadLineTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(widget.article.publisher!.name!, textScaleFactor: 0.9),
                const SizedBox(
                  width: 10,
                ),
                Text(
                    DateUtilities().hoursBetween(
                          DateTime.parse(widget.article.publishedAt!),
                          DateTime.now(),
                        ) ??
                        '0h',
                    textScaleFactor: 0.9),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.article.title!,
              textScaleFactor: 1.6,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          InkWell(
            onTap: () {
              UrlUtilities().urlLaunch(widget.article.url!);
            },
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    widget.article.urlToImage!,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            widget.article.description!,
                            textScaleFactor: 1.2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Icon(
                      //         FontAwesomeIcons.at,
                      //         color: Colors.greenAccent,
                      //         size: 13,
                      //       ),
                      //       Expanded(
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(left: 4.0),
                      //           child: Text(
                      //             widget.article.author!,
                      //             overflow: TextOverflow.clip,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.8,
          )
        ],
      ),
    );
  }
}
