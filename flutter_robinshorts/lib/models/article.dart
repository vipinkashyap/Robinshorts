import 'package:equatable/equatable.dart';
part 'publisher.dart';

class Article extends Equatable {
  final Publisher? publisher;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.publisher,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      publisher: Publisher.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] ?? 'Trent Crim',
      title: map['title'] ?? 'Ted Lasso confirmed as team manager at Richmond',
      description: map['description'] ??
          'Great news today for football fans here at Richmond. An american coach is taking over',
      url: map['url'],
      urlToImage: map['urlToImage'] ??
          "https://s.yimg.com/os/creatr-uploaded-images/2022-06/12901c20-e64c-11ec-bffb-fba98ac5a23f",
      publishedAt: map['publishedAt'] ?? "2022-06-07T10:46:05Z",
      content: map['content'] ??
          "Europe has reached a deal to make USB-C a common charger for all phones and electronic devices, with the aim to reduce e-waste and inconvenience with incompatible chargers. \"Under the new rules, cons… [+2202 chars]",
    );
  }

  @override
  List<Object?> get props => [
        publisher,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];

  @override
  bool? get stringify => true;
}
