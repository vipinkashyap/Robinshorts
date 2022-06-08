import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_robinshorts/data/data.dart';
import 'package:flutter_robinshorts/firebase_options.dart';
import 'package:flutter_robinshorts/robin_bloc_observer.dart';
import 'package:flutter_robinshorts/utilities/utilities.dart';

import 'blocs/blocs.dart';

void main() async {
  EquatableConfig.stringify = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: RobinBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(FirebaseAuthenticationRepository())
                ..add(AuthenticationStarted()),
        ),
        BlocProvider(
          create: (context) => NewsBloc()..add(FetchTopHeadlines()),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: AuthBlocNavigate(),
      ),
    );
  }
}
