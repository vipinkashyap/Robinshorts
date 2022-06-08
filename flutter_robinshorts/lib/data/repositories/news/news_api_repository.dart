import 'package:flutter_robinshorts/data/apis/news_api.dart';
import 'package:flutter_robinshorts/data/repositories/news/base_news_repository.dart';
import 'package:flutter_robinshorts/models/article.dart';

class NewsApiRepository implements BaseNewsRepository {
  final NewsApi _newsApi = NewsApi();
  @override
  Future<List<Article>> fetchTopHeadlines() async {
    return await _newsApi.fetchTopHeadlines();
  }

  @override
  Future<List<Article>> fetchRelevantHeadlines({required String query}) async {
    return await _newsApi.fetchRelevantHeadlines(query);
  }
}
