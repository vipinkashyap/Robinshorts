import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robinnews_v/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAuth.instance;
  runApp(
    MyApp(),
  );
}
