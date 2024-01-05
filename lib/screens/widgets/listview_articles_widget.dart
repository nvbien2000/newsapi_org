import 'package:flutter/material.dart';
import 'package:vietravel/models/article_model.dart';
import 'package:vietravel/screens/widgets/article_widget.dart';

class ListViewArticleWidget extends StatelessWidget {
  final List<ArticleModel> articles;
  final bool isNeedToShowSource;

  const ListViewArticleWidget({
    super.key,
    required this.articles,
    this.isNeedToShowSource = false,
  });

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const Center(
        child: Text('No articles'),
      );
    }
    return ListView.separated(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleWidget(
          title: article.title,
          imageUrl: article.urlToImage,
          publishedDate: article.publishedAt,
          description: article.description,
          source: article.sourceModel.name,
          isNeedToShowSource: isNeedToShowSource,
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
