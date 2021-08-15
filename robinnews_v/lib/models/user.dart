import 'package:meta/meta.dart';

@immutable
class User {
  final String uid;
  final String? displayName;
  final String? photoUrl;
  final String? email;

  const User({
    required this.uid,
    this.displayName,
    this.photoUrl,
    this.email,
  });
}
