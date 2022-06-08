part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchTopHeadlines extends NewsEvent {}

class SearchHeadlines extends NewsEvent {
  final String query;

  const SearchHeadlines(this.query);
}
