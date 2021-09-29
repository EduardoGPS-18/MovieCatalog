import 'dart:convert';

import 'package:http/http.dart';

import '../../data/http/http.dart';

class HTTPAdapter implements HTTPClient {
  final Client client;

  HTTPAdapter(this.client);

  @override
  Future<dynamic> request({
    required String url,
    required HTTPMethod method,
    Map? body,
    Map<String, String>? headers,
  }) async {
    final defaultHeaders = headers ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
      });

    final jsonBody = body != null ? jsonEncode(body) : null;

    Response response = Response('', 500);
    late Future<Response>? futureResponse;

    try {
      if (method == HTTPMethod.post) {
        futureResponse = client.post(Uri.parse(url), headers: defaultHeaders, body: jsonBody);
      } else if (method == HTTPMethod.get) {
        futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
      } else if (method == HTTPMethod.put) {
        futureResponse = client.put(Uri.parse(url), headers: defaultHeaders, body: jsonBody);
      }

      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 25));
      }
    } catch (error) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? {} : jsonDecode(response.body);
    } else if (response.statusCode == 201) {
      return response.body.isEmpty ? {} : jsonDecode(response.body);
    } else if (response.statusCode == 204) {
      return {};
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
