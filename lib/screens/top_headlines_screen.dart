import 'package:flutter/material.dart';
import 'package:vietravel/locator.dart';
import 'package:vietravel/models/article_model.dart';
import 'package:vietravel/repositories/news_repo.dart';
import 'package:vietravel/screens/search_screen.dart';
import 'package:vietravel/screens/widgets/listview_articles_widget.dart';

class TopHeadlinesScreen extends StatefulWidget {
  const TopHeadlinesScreen({super.key});

  @override
  State<TopHeadlinesScreen> createState() => _TopHeadlinesScreenState();
}

class _TopHeadlinesScreenState extends State<TopHeadlinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
      ),
      body: FutureBuilder(
        future: getIt.get<NewsRepository>().getTopHeadlines(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListViewArticleWidget(
              articles: snapshot.data as List<ArticleModel>,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SearchScreen()));
        },
      ),
    );
  }
}
