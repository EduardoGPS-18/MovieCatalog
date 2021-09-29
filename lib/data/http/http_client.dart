abstract class HTTPClient {
  Future<dynamic> request({
    required String url,
    required HTTPMethod method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}

enum HTTPMethod { get, put, post }
