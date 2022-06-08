part of 'article.dart';

class Publisher extends Equatable {
  final String? id;
  final String? name;

  const Publisher({this.id, this.name});

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;

  factory Publisher.fromJson(Map<String, dynamic> map) {
    return Publisher(id: map['id'] ?? '0', name: map['name'] ?? 'Anon Network');
  }
}
