import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robinnews_v/screens/home.dart';
import 'package:robinnews_v/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          textTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      title: 'Robin News',
      home: Consumer<User?>(
        builder: (_, user, __) {
          if (user == null) {
            return LoginScreen();
          }
          return HomeScreen();
        },
      ),
    );
  }
}
