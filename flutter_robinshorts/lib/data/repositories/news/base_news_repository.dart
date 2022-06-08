import '../../../models/models.dart';

abstract class BaseNewsRepository {
  Future<List<Article>> fetchTopHeadlines();
  Future<List<Article>> fetchRelevantHeadlines({required String query});
}
