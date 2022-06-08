import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../screens/screens.dart';

class AuthBlocNavigate extends StatelessWidget {
  const AuthBlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const NewsFeedScreen();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
