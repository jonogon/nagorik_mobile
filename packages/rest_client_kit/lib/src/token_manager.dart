import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../rest_client_kit.dart';

class TokenManager extends Interceptor {
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  final String? refreshTokenEndpoint;

  TokenManager({required this.refreshTokenEndpoint});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    List<String> accessTokenKeys = [
      'access_token',
      'accessToken',
      'token',
      'access',
    ];

    List<String> refreshTokenKeys = [
      'refresh_token',
      'refreshToken',
      'refresh',
    ];

    // Function to recursively search for keys in a nested JSON object
    void findTokens(Map<String, dynamic> json) {
      for (var key in json.keys) {
        var value = json[key];

        if (accessTokenKeys.contains(key) && value is String) {
          log(
            'Found access token: $value',
            name: 'RestClientKit/TokenStorageHandler',
          );
          saveToken(_accessTokenKey, value);
        } else if (refreshTokenKeys.contains(key) && value is String) {
          log(
            'Found refresh token: $value',
            name: 'RestClientKit/TokenStorageHandler',
          );
          saveToken(_refreshTokenKey, value);
        } else if (value is Map<String, dynamic>) {
          findTokens(value);
        } else if (value is List) {
          for (var item in value) {
            if (item is Map<String, dynamic>) {
              findTokens(item);
            }
          }
        }
      }
    }

    try {
      if (response.data is Map<String, dynamic>) {
        findTokens(response.data);
      }
    } catch (e, stackTrace) {
      log(
        'Failed to parse tokens: $e',
        name: 'RestClientKit/TokenStorageHandler',
        error: e,
        stackTrace: stackTrace,
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (refreshTokenEndpoint == null) {
        log(
          'No refresh token endpoint provided',
          name: 'RestClientKit/TokenManager',
          level: 2000,
        );
        super.onError(err, handler);
        return;
      }

      // Handle token refresh logic here
      final refreshToken = await getRefreshToken();
      if (refreshToken != null) {
        final newAccessToken = await this.refreshToken();
        if (newAccessToken != null) {
          await saveToken(newAccessToken, refreshToken);
          // Retry the request with the new access token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';
          final response = await Dio().fetch(options);
          return handler.resolve(response);
        }
      }
    }
    super.onError(err, handler);
  }

  Future<void> saveToken(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  Future<String?> refreshToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await Dio().post(refreshTokenEndpoint!, data: {
        'refresh_token': refreshToken,
      });
      if (response.statusCode == 200) {
        return response.data['access_token'];
      }
    } catch (e) {
      log('Failed to refresh token: $e');
      throw Unauthorized(e);
    }
    return null;
  }
}
