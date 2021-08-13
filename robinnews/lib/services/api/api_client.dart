import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final String apiKey = '48e07757bb0e4b128fd5ecd7c3b1b223';

  final String sourcesEndPoint = '/v2/top-headlines/sources';
  final String topHeadLinesEndPoint = '/v2/top-headlines';
  final String everythingEndPoint = '/v2/everything';

  Uri makeUrl(String endPoint) {
    return Uri.https('newsapi.org', endPoint, {
      'apiKey': this.apiKey,
      'q': 'modi',
      'qInTitle': 'bjp',
      'language': 'en',
      'sortBy': 'publishedAt'
    });
  }

  Future getNews() async {
    var response = await http.get(makeUrl(this.everythingEndPoint));
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      default:
        return response.statusCode;
    }
  }
}
