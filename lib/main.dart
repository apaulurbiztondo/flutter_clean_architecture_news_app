import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loywardly_data_layer/features/daily_news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:loywardly_data_layer/features/daily_news/presentation/bloc/article/remote_article_event.dart';
import 'package:loywardly_data_layer/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:loywardly_data_layer/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => s1()..add(const GetArticles()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DailyNews(),
      ),
    );
  }
}
