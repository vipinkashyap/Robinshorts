part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final UserModel userModel;

  const AuthenticationSuccess(this.userModel);
}

class AuthenticationFailure extends AuthenticationState {}
