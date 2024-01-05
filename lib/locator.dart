/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

import 'package:get_it/get_it.dart';
import 'package:vietravel/repositories/news_repo.dart';
import 'package:vietravel/repositories/news_repo_impl.dart';

import 'network/api_client.dart';
import 'network/api_client_impl.dart';

GetIt getIt = GetIt.instance;

void setupSingletonLocator() {
  getIt.registerSingleton<ApiClient>(ApiClientImpl());

  getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl());
}
