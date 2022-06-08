import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_robinshorts/data/data.dart';

import '../../models/models.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthenticationRepository _authenticationRepository;
  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    on<AuthenticationStarted>(_onAuthenticationStarted);
    on<AuthenticationSignedOut>(_onAuthenticationSignedOut);
  }

  void _onAuthenticationStarted(event, emit) async {
    final UserModel user =
        await _authenticationRepository.signIn().then((value) => value!);
    if (user.uid != 'uid') {
      emit(AuthenticationSuccess(const UserModel()
          .copyWith(uid: user.uid, savedArticles: user.savedArticles)));
    } else {
      emit(AuthenticationFailure());
    }
  }

  void _onAuthenticationSignedOut(event, emit) async {
    await _authenticationRepository.signOut();
    emit(AuthenticationFailure());
  }
}
