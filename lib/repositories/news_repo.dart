/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

import 'package:vietravel/models/article_model.dart';

abstract class NewsRepository {
  Future<List<ArticleModel>> getTopHeadlines();
  Future<List<ArticleModel>> search(String keyword);
}
