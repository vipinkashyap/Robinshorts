import 'package:flutter/material.dart';
import 'package:robinnews_v/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
      title: 'Robin News',
      routes: {'/': (_) => HomeScreen()},
    );
  }
}
