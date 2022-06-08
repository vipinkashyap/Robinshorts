import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/models.dart';

class NewsApi {
  final http.Client _client = http.Client();
  static const String _newsApiKey = '48e07757bb0e4b128fd5ecd7c3b1b223';
  static const String _topHeadlinesEndPoint = '/v2/top-headlines';
  static const String _everythingEndPoint = '/v2/everything';
  static const String _defaultCountry = 'us';
  static const String _baseUrl = 'newsapi.org';

  final Uri _topHeadlinesUri = Uri.https(_baseUrl, _topHeadlinesEndPoint, {
    'apiKey': _newsApiKey,
    'country': _defaultCountry,
    'pageSize': '100',
  });

  Uri _relevantHealinesUri(String query) =>
      Uri.https(_baseUrl, _everythingEndPoint, {
        'apiKey': _newsApiKey,
        'searchIn': 'title,description,content',
        'language': 'en',
        'sortBy': 'relevancy',
        'q': query,
      });

  Future<List<Article>> fetchTopHeadlines() async {
    var response = await _client.get(_topHeadlinesUri);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body) as Map<String, dynamic>;
      var articles = body['articles'] as List<dynamic>;
      log('Articles:$articles');
      var parsedArticles = articles.map((e) => Article.fromJson(e)).toList();
      log('Parsed Articles $parsedArticles');
      return parsedArticles;
    } else {
      throw Exception();
    }
  }

  Future<List<Article>> fetchRelevantHeadlines(String query) async {
    var response = await _client.get(_relevantHealinesUri(query));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body) as Map<String, dynamic>;
      var articles = body['articles'] as List<dynamic>;
      log('Articles:$articles');
      var parsedArticles = articles.map((e) => Article.fromJson(e)).toList();
      log('Parsed Articles $parsedArticles');
      return parsedArticles;
    } else {
      throw Exception();
    }
  }
}
