import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_motel/models/response/motel_model.dart';
import 'package:guia_motel/repositories/implementations/motel_repository.dart';
import 'package:guia_motel/services/http/api_client.dart';
import 'package:guia_motel/services/http/http_exeption.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../mocks/motel_mock.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() async {
  late MotelRepository motelRepository;
  late MockApiClient mockApiClient;

  mockApiClient = MockApiClient();
  motelRepository = MotelRepository(mockApiClient);

  group('MotelRepository.getAllMotels', () {
    test('deve retornar uma lista de Motel quando a resposta for válida',
        () async {
      // Arrange
      when(() => mockApiClient.getData(any(),
              queryParams: any(named: 'queryParams')))
          .thenAnswer((_) async => http.Response(responseMock, 200));

      final result = await motelRepository.getAllMotels();

      // MotelModel
      expect(result, isA<List<MotelModel>>());
      expect(result.length, 1);

      final motel = result.first;
      expect(motel.fantasyName, "Motel Le Nid");
      expect(motel.logo,
          "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif");
      expect(motel.neighborhood, "Chácara Flora - São Paulo");
      expect(motel.favoritesCount, 0);
      expect(motel.reviewsCount, 2159);
      expect(motel.rating, 4.6);

      // SuiteModel
      expect(motel.suites.first.name, "Suíte Marselha s/ garagem privativa");
      expect(motel.suites.first.amount, 1);
      expect(motel.suites.first.showAvailableQuantity, true);
      expect(motel.suites.first.photos, isNotEmpty);
      // SuiteItemModel
      expect(motel.suites.first.items.first.name, "ducha dupla");

      //CategoryItemModel
      expect(motel.suites.first.categoryItems.first.name, "Frigobar");
      expect(motel.suites.first.categoryItems.first.icon,
          "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png");

      //PeriodModel
      expect(motel.suites.first.periods.first.formattedTime, "3 horas");
      expect(motel.suites.first.periods.first.time, "3");
      expect(motel.suites.first.periods.first.value, 88.0);
      expect(motel.suites.first.periods.first.totalValue, 88.0);
      expect(motel.suites.first.periods.first.hasCourtesy, false);
      expect(motel.suites.first.periods.first.discount, isNull);
    });

    test('deve lançar exceção quando a API retornar erro', () async {
      // Arrange
      when(() => mockApiClient.getData(any()))
          .thenThrow(HttpExceptionModel("Erro de servidor"));

      // Act & Assert
      expect(() => motelRepository.getAllMotels(),
          throwsA(isA<HttpExceptionModel>()));
    });
  });

  group('getAllMotels - Testes de Exceção', () {
    test('deve repassar HttpExceptionModel lançada pelo ApiClient', () async {
      final exception = HttpExceptionModel("Erro de servidor");
      when(() => mockApiClient.getData(any())).thenThrow(exception);

      expect(() => motelRepository.getAllMotels(), throwsA(exception));
    });

    test('deve repassar SocketException lançada pelo ApiClient', () async {
      when(() => mockApiClient.getData(any()))
          .thenThrow(const SocketException("Sem conexão"));

      expect(() => motelRepository.getAllMotels(),
          throwsA(isA<SocketException>()));
    });

    test('deve repassar TimeoutException lançada pelo ApiClient', () async {
      when(() => mockApiClient.getData(any()))
          .thenThrow(TimeoutException("Timeout"));

      expect(() => motelRepository.getAllMotels(),
          throwsA(isA<TimeoutException>()));
    });

    test('deve repassar FormatException em caso de JSON inválido', () async {
      when(() => mockApiClient.getData(any()))
          .thenAnswer((_) async => http.Response('{invalid json}', 200));

      expect(() => motelRepository.getAllMotels(),
          throwsA(isA<FormatException>()));
    });
  });

  group(
    "MotelRepository.GetPopularMotels",
    () {
      test('deve retornar uma lista de Motel quando a resposta for válida',
          () async {
        when(() => mockApiClient.getData(any(),
                queryParams: any(named: 'queryParams')))
            .thenAnswer((_) async => http.Response(responsePopularMock, 200));

        final result = await motelRepository.getPopularMotels();
        expect(result.first.rating, greaterThanOrEqualTo(result[1].rating));
        if (result.first.rating == result[1].rating) {
          expect(result.first.reviewsCount,
              greaterThanOrEqualTo(result[1].reviewsCount));
        }
      });
    },
  );
}
