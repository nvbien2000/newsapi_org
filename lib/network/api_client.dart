/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

abstract class ApiClient {
  /// Makes a GET request to the specified URL.
  Future<dynamic> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });

  /// Makes a POST request to the specified URL with a JSON body.
  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  });

  /// Makes a PUT request to the specified URL with a JSON body.
  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  });

  /// Makes a DELETE request to the specified URL.
  Future<dynamic> delete(
    String url, {
    Map<String, String>? headers,
  });
}
