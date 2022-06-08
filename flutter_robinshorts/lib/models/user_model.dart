import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_robinshorts/models/article.dart';

class UserModel extends Equatable {
  final String? uid;
  final List<Article>? savedArticles;

  const UserModel({this.savedArticles, this.uid});

  @override
  List<Object?> get props => [uid, savedArticles];

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'savedArticles': savedArticles};
  }

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(uid: doc.id, savedArticles: doc['savedArticles']);
  }

  UserModel copyWith({String? uid, List<Article>? savedArticles}) {
    return UserModel(
        uid: uid ?? this.uid,
        savedArticles: savedArticles ?? this.savedArticles);
  }
}
