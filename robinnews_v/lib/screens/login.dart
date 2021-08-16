import 'package:flutter/material.dart';
import 'package:robinnews_v/services/auth/firebase_auth_client.dart';

final _authClient = FireBaseAuthService();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _authClient.signInWithGoogle();
          },
          child: Text('Login firebase'),
        ),
      ),
    );
  }
}
