import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:guia_motel/services/http/http_exeption.dart';
import 'package:http/http.dart' as http;

class ApiClient extends ChangeNotifier {
  final http.Client client;
  ApiClient({http.Client? client}) : client = client ?? http.Client();

  final Map<String, String> _mainHeaders = {"Content-Type": "application/json"};

  final String url = 'https://jsonkeeper.com';

  Future<http.Response> getData(
    String path, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Uri uri =
        Uri.parse('https://www.jsonkeeper.com/b/1IXK').replace(queryParameters: queryParams);
    final finalHeaders = {..._mainHeaders, if (headers != null) ...headers};
    try {
      final response = await client
          .get(uri, headers: finalHeaders)
          .timeout(const Duration(seconds: 15));
      return _handleHttpResponse(response);
    } on HttpException catch (e) {
      throw HttpExceptionModel(e.message);
    } on TimeoutException {
      throw HttpExceptionModel("Conexão lenta");
    } on SocketException {
      throw HttpExceptionModel("Erro de conexão");
    } catch (e) {
      throw HttpExceptionModel("Algo deu errado");
    }
  }

  Future<http.Response> postData(
    String path, {
    Object? body,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Uri uri =
        Uri.parse('$url$path').replace(queryParameters: queryParams);
    final finalHeaders = {..._mainHeaders, if (headers != null) ...headers};
    try {
      final response = await client
          .post(uri,
              headers: finalHeaders,
              body: body != null ? jsonEncode(body) : null)
          .timeout(const Duration(seconds: 15));
      return _handleHttpResponse(response);
    } on HttpException catch (e) {
      throw HttpExceptionModel(e.message);
    } on TimeoutException {
      throw HttpExceptionModel("Conexão lenta");
    } on SocketException {
      throw HttpExceptionModel("Erro de conexão");
    } catch (e) {
      throw HttpExceptionModel("Algo deu errado");
    }
  }

  Future<http.Response> deleteData(
    String path, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Uri uri =
        Uri.parse('$url$path').replace(queryParameters: queryParams);
    final finalHeaders = {..._mainHeaders, if (headers != null) ...headers};
    try {
      final response = await client.delete(uri, headers: finalHeaders);
      return _handleHttpResponse(response);
    } on HttpException catch (e) {
      throw HttpExceptionModel(e.message);
    } on TimeoutException {
      throw HttpExceptionModel("Conexão lenta");
    } on SocketException {
      throw HttpExceptionModel("Erro de conexão");
    } catch (e) {
      throw HttpExceptionModel("Algo deu errado");
    }
  }

  Future<http.Response> putData(
    String path, {
    Object? body,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Uri uri =
        Uri.parse('$url$path').replace(queryParameters: queryParams);
    final finalHeaders = {..._mainHeaders, if (headers != null) ...headers};
    try {
      final response = await client.put(uri,
          headers: finalHeaders, body: body != null ? jsonEncode(body) : null);
      return _handleHttpResponse(response);
    } on HttpException catch (e) {
      throw HttpExceptionModel(e.message);
    } on TimeoutException {
      throw HttpExceptionModel("Conexão lenta");
    } on SocketException {
      throw HttpExceptionModel("Erro de conexão");
    } catch (e) {
      throw HttpExceptionModel("Algo deu errado");
    }
  }

  Future<http.Response> loadImageFromUrlWithHttp(String imageUrl) async {
    try {
      final response =
          await client.get(Uri.parse(imageUrl), headers: {'Accept': 'image/*'});
      return _handleHttpResponse(response);
    } on HttpException catch (e) {
      throw HttpExceptionModel(e.message);
    } on TimeoutException {
      throw HttpExceptionModel("Conexão lenta");
    } on SocketException {
      throw HttpExceptionModel("Erro de conexão");
    } catch (e) {
      throw HttpExceptionModel("Algo deu errado");
    }
  }

  http.Response _handleHttpResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final body = jsonDecode(response.body);
      if (body['errors'] != null && (body['errors'] as List).isNotEmpty) {
        throw HttpException(
          body['errors'][0]['message'],
        );
      } else {
        throw const HttpException(
          'Algo deu errado',
        );
      }
    }
  }
}
