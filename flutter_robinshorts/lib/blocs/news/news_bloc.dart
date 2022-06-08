import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_robinshorts/data/data.dart';

import '../../models/models.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApiRepository _newsApiRepository = NewsApiRepository();
  NewsBloc() : super(NewsInitial()) {
    on<FetchTopHeadlines>(_onFetchTopHeadlines);
    on<SearchHeadlines>(_onSearchHeadlines);
  }

  void _onFetchTopHeadlines(event, emit) async {
    emit(NewsLoading());
    var articles = await _newsApiRepository.fetchTopHeadlines();
    log('Articles : $articles');

    emit(NewsLoaded(articles));
  }

  void _onSearchHeadlines(event, emit) async {
    emit(NewsLoading());
    var articles =
        await _newsApiRepository.fetchRelevantHeadlines(query: event.query);
    log('Articles : $articles');

    emit(NewsLoaded(articles));
  }
}
