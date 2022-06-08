import 'package:flutter_robinshorts/data/apis/firestore_db_api.dart';
import 'package:flutter_robinshorts/data/repositories/database/base_firestore_db_repository.dart';
import 'package:flutter_robinshorts/models/user_model.dart';

class FirestoreDBRepository implements BaseFirestoreDBRepository {
  final FirestoreDBApi _firestoreDBApi = FirestoreDBApi();
  @override
  Future<List<UserModel>> retrieveUserData() {
    return _firestoreDBApi.retrieveUserData();
  }

  @override
  Future<void> saveUserData(UserModel user) {
    return _firestoreDBApi.addUserData(user);
  }
}
