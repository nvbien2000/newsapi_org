import 'package:vietravel/models/article_model.dart';

class NewsResponse {
  String status;
  int totalResults;
  List<ArticleModel> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"] as String,
        totalResults: json["totalResults"] as int,
        articles: List<ArticleModel>.from(
          (json["articles"] as List).map((x) => ArticleModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
