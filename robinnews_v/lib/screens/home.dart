import 'package:flutter/material.dart';
import 'package:robinnews_v/widgets/top_headlines.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ROBIN NEWS'),
      ),
      body: FutureHeadlines(),
    );
  }
}
