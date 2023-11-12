import 'dart:io';

import 'package:dio/dio.dart';
import 'package:loywardly_data_layer/core/constants/constants.dart';
import 'package:loywardly_data_layer/core/resources/data_state.dart';
import 'package:loywardly_data_layer/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:loywardly_data_layer/features/daily_news/domain/repository/article_repository.dart';

import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  late final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
        apiKey: NEWS_API_KEY,
        country: COUNTRY_QUERY,
        category: CATEGORY_QUERY,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(DioException(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        type: DioExceptionType.badResponse,
        requestOptions: httpResponse.response.requestOptions,
      ));
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
