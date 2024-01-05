/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_client.dart';
import 'api_path.dart';

/// API key for free weather API, this is not too secret :)
const String _kApiKey = "81a6663c354548dcaa6a5eb6f099bfc1";

class ApiClientImpl implements ApiClient {
  ApiClientImpl();

  @override
  Future<dynamic> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Map<String, dynamic> fullParams = {"apiKey": _kApiKey};
    if (queryParameters != null) fullParams.addAll(queryParameters);

    final fullUrl = Uri.http(ApiPath.BASE_URL, path, fullParams);
    final response = await http.get(
      fullUrl,
      headers: headers,
    );

    _checkStatusCode(response);

    return jsonDecode(response.body);
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final fullUrl = Uri.http(ApiPath.BASE_URL, path);
    final response = await http.post(
      fullUrl,
      headers: headers,
      body: _encodeBody(body),
    );

    _checkStatusCode(response);

    return jsonDecode(response.body);
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final fullUrl = Uri.http(ApiPath.BASE_URL, path);
    final response = await http.put(
      fullUrl,
      headers: headers,
      body: _encodeBody(body),
    );

    _checkStatusCode(response);

    return jsonDecode(response.body);
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, String>? headers,
  }) async {
    final fullUrl = Uri.http(ApiPath.BASE_URL, path);
    final response = await http.delete(
      fullUrl,
      headers: headers,
    );

    _checkStatusCode(response);

    return null;
  }

  void _checkStatusCode(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      try {
        final errorBody = jsonDecode(response.body);
        final errorMessage = errorBody['message'] ?? 'Unknown error';
        throw Exception(
          'API call failed with status code: ${response.statusCode}\nError message: $errorMessage',
        );
      } catch (_) {
        throw Exception(
          'API call failed with status code: ${response.statusCode}\nError body: ${response.body}',
        );
      }
    }
  }

  String _encodeBody(dynamic body) {
    if (body is String) {
      return body;
    } else {
      return jsonEncode(body);
    }
  }
}
