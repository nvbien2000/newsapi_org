/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

// ignore_for_file: constant_identifier_names

class ApiPath {
  static const String BASE_URL = 'newsapi.org';
  static const String VER = '/v2';

  static const String topHeadlines = '$VER/top-headlines';
  static const String search = '$VER/everything';
}
