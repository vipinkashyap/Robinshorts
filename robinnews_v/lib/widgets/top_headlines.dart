import 'package:flutter/material.dart';
import 'package:robinnews_v/services/api/api_client.dart';
import 'package:robinnews_v/widgets/headline_tile.dart';

class FutureHeadlines extends StatefulWidget {
  const FutureHeadlines({Key? key}) : super(key: key);

  @override
  _FutureHeadlinesState createState() => _FutureHeadlinesState();
}

class _FutureHeadlinesState extends State<FutureHeadlines> {
  final ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _apiClient.topHeadlines(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data['articles'].length,
              itemBuilder: (BuildContext context, int index) {
                return HeadLineTile(
                  // context: context,
                  snapshot: snapshot,
                  index: index,
                );
              });
        } else if (snapshot.hasError) {
          return throw Exception(snapshot.error);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}