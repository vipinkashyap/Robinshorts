import '../../../models/models.dart';

abstract class BaseFirestoreDBRepository {
  Future<void> saveUserData(UserModel user);
  Future<List<UserModel>> retrieveUserData();
}
