import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final String apiKey = '48e07757bb0e4b128fd5ecd7c3b1b223';
  final String baseUrl = 'newsapi.org';
  final String everythingEndPoint = '/v2/everything';
  final String topHeadlinesEndPoint = '/v2/top-headlines';
  final String sourcesEndPoint = '/v2/top-headlines/sources';
  final String defaultCountry = 'us';
  final String homeCountry = 'in';

  Uri makeUri(String endPoint) {
    print(
      Uri.https(
        this.baseUrl,
        endPoint,
        endPoint == this.sourcesEndPoint
            ? {
                'apiKey': this.apiKey,
                'language': 'en',
              }
            : endPoint == this.topHeadlinesEndPoint
                ? {'apiKey': this.apiKey, 'country': this.homeCountry}
                : {},
      ),
    );
    return Uri.https(
      this.baseUrl,
      endPoint,
      endPoint == this.sourcesEndPoint
          ? {
              'apiKey': this.apiKey,
              'language': 'en',
            }
          : endPoint == this.topHeadlinesEndPoint
              ? {
                  'apiKey': this.apiKey,
                  'country': this.defaultCountry,
                }
              : {},
    );
  }

  Future<dynamic> topHeadlines() async {
    var response = await http.get(makeUri(this.topHeadlinesEndPoint));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> headlineSources() async {
    var response = await http.get(makeUri(this.sourcesEndPoint));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
