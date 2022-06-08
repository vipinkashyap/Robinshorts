import '../../../models/models.dart';

abstract class BaseAuthenticationRepository {
  Stream<UserModel> getCurrentUser();
  Future<UserModel?> signIn();
  Future<void> signOut();
}
