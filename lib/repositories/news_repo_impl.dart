import 'package:vietravel/locator.dart';
import 'package:vietravel/models/article_model.dart';
import 'package:vietravel/models/news_response.dart';
import 'package:vietravel/network/api_client.dart';
import 'package:vietravel/network/api_path.dart';
import 'package:vietravel/repositories/news_repo.dart';

class NewsRepositoryImpl extends NewsRepository {
  final ApiClient _apiService = getIt.get<ApiClient>();

  @override
  Future<List<ArticleModel>> getTopHeadlines() async {
    const String url = ApiPath.topHeadlines;
    final Map<String, dynamic> response = await _apiService.get(
      url,
      queryParameters: {'country': 'us'},
    );

    NewsResponse newsResponse = NewsResponse.fromJson(response);
    if (newsResponse.articles.isNotEmpty) {
      return newsResponse.articles;
    } else {
      return [];
    }
  }

  @override
  Future<List<ArticleModel>> search(String keyword) async {
    const String url = ApiPath.search;
    final Map<String, dynamic> response = await _apiService.get(
      url,
      queryParameters: {'q': keyword},
    );

    NewsResponse newsResponse = NewsResponse.fromJson(response);
    if (newsResponse.articles.isNotEmpty) {
      return newsResponse.articles;
    } else {
      return [];
    }
  }
}
