import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robinnews_v/app.dart';

import 'package:robinnews_v/services/auth/firebase_auth_client.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => FireBaseAuthService(),
        ),
        StreamProvider<User?>(
            create: (context) =>
                context.read<FireBaseAuthService>().onAuthStateChanged,
            initialData: null)
      ],
      child: MyApp(),
    ),
  );
}
