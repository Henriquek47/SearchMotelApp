import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_motel/services/http/api_client.dart';
import 'package:guia_motel/services/http/http_exeption.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

class UriFake extends Fake implements Uri {}

void main() {
  late ApiClient apiClient;
  late MockHttpClient mockHttpClient;

  setUp(() {
    registerFallbackValue(UriFake());
    mockHttpClient = MockHttpClient();
    apiClient = ApiClient(client: mockHttpClient);
  });

  group('ApiClient', () {
    group('getData', () {
      test('deve retornar resposta válida para status 200', () async {
        when(() => mockHttpClient.get(
              any<Uri>(),
              headers: any(named: 'headers'),
            )).thenAnswer((_) async => http.Response('{"success": true}', 200));

        final response = await apiClient.getData('/test');

        expect(response.statusCode, 200);
        expect(jsonDecode(response.body)['success'], true);
      });

      test('deve lançar HttpExceptionModel para status 400', () async {
        when(() => mockHttpClient.get(any<Uri>()))
            .thenAnswer((_) async => http.Response('Erro', 400));

        expect(
          () => apiClient.getData('/test'),
          throwsA(isA<HttpExceptionModel>()),
        );
      });

      test('deve lançar HttpExceptionModel em caso de TimeoutException', () async {
        when(() => mockHttpClient.get(any<Uri>()))
            .thenThrow(TimeoutException('Timeout'));

        expect(
          () => apiClient.getData('/test'),
          throwsA(isA<HttpExceptionModel>()),
        );
      });
    });

    group('postData', () {
      test('deve enviar body corretamente e retornar status 201', () async {
        const body = {'key': 'value'};
        when(() => mockHttpClient.post(
              any<Uri>(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenAnswer((_) async => http.Response('{"success": true}', 201));

        final response = await apiClient.postData('/test', body: body);

        expect(response.statusCode, 201);
        expect(jsonDecode(response.body)['success'], true);
      });
    });

    group('putData', () {
      test('deve retornar resposta válida para status 200', () async {
        when(() => mockHttpClient.put(
              any<Uri>(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenAnswer((_) async => http.Response('{"updated": true}', 200));

        final response = await apiClient.putData('/update', body: {'foo': 'bar'});
        expect(response.statusCode, 200);
        expect(jsonDecode(response.body)['updated'], true);
      });

      test('deve lançar HttpExceptionModel para status 400', () async {
        when(() => mockHttpClient.put(
              any<Uri>(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenAnswer(
          (_) async => http.Response(
            '{"errors":[{"message": "Bad request"}]}',
            400,
          ),
        );

        expect(
          () => apiClient.putData('/update', body: {'teste': 'bar'}),
          throwsA(isA<HttpExceptionModel>()),
        );
      });

      test('deve lançar HttpExceptionModel em caso de SocketException', () async {
        when(() => mockHttpClient.put(
              any<Uri>(),
              headers: any(named: 'headers'),
              body: any(named: 'body'),
            )).thenThrow(const SocketException("Erro de conexão"));

        expect(
          () => apiClient.putData('/update'),
          throwsA(isA<HttpExceptionModel>()),
        );
      });
    });

    group('deleteData', () {
      test('deve retornar resposta válida para status 204', () async {
        when(() => mockHttpClient.delete(
              any<Uri>(),
              headers: any(named: 'headers'),
            )).thenAnswer((_) async => http.Response('', 204));

        final response = await apiClient.deleteData('/delete');
        expect(response.statusCode, 204);
      });

      test('deve lançar HttpExceptionModel para status 404', () async {
        when(() => mockHttpClient.delete(
              any<Uri>(),
              headers: any(named: 'headers'),
            )).thenAnswer(
          (_) async => http.Response(
            '{"error": {"message": "Not found"}}',
            404,
          ),
        );

        expect(
          () => apiClient.deleteData('/delete'),
          throwsA(isA<HttpExceptionModel>()),
        );
      });

      test('deve lançar HttpExceptionModel em caso de TimeoutException', () async {
        when(() => mockHttpClient.delete(
              any<Uri>(),
              headers: any(named: 'headers'),
            )).thenThrow(TimeoutException("Timeout"));

        expect(
          () => apiClient.deleteData('/delete'),
          throwsA(isA<HttpExceptionModel>()),
        );
      });
    });

    group('loadImageFromUrlWithHttp', () {
      test('deve retornar http.Response com status 200 (imagem)', () async {
        when(() => mockHttpClient.get(
              any<Uri>(),
              headers: any(named: 'headers'),
            )).thenAnswer((_) async => http.Response('binaryImageData', 200));

        final imageUrl = 'https://example.com/image.png';
        final response = await apiClient.loadImageFromUrlWithHttp(imageUrl);

        expect(response.statusCode, 200);
        expect(response.body, 'binaryImageData');
      });

      test('deve lançar HttpExceptionModel em caso de SocketException', () async {
        when(() => mockHttpClient.get(
              any<Uri>(),
              headers: any(named: 'headers'),
            )).thenThrow(const SocketException("Erro de conexão"));

        expect(
          () => apiClient.loadImageFromUrlWithHttp('https://example.com/image.png'),
          throwsA(isA<HttpExceptionModel>()),
        );
      });

      test('deve lançar HttpExceptionModel se status 404 for retornado', () async {
        when(() => mockHttpClient.get(
              any<Uri>(),
              headers: {'Accept': 'image/*'},
            )).thenAnswer(
          (_) async => http.Response(
            '{"errors":[{"message":"Not Found"}]}',
            404,
          ),
        );

        expect(
          () => apiClient.loadImageFromUrlWithHttp('https://example.com/notfound.png'),
          throwsA(isA<HttpExceptionModel>()),
        );
      });
    });
  });
}
