import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loywardly_data_layer/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:loywardly_data_layer/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:loywardly_data_layer/features/daily_news/domain/repository/article_repository.dart';
import 'package:loywardly_data_layer/features/daily_news/domain/usecases/get_article.dart';
import 'package:loywardly_data_layer/features/daily_news/presentation/bloc/article/remote_article_bloc.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  s1.registerSingleton<Dio>(Dio());
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));
  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1()));
  s1.registerSingleton<GetArticleUseCase>(GetArticleUseCase(s1()));
  s1.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(s1()));
}
