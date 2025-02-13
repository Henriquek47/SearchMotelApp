import 'package:flutter_test/flutter_test.dart';
import 'package:guia_motel/features/home/view_model/home_view_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guia_motel/repositories/implementations/motel_repository.dart';
import 'package:guia_motel/models/response/motel_model.dart';

class MockMotelRepository extends Mock implements MotelRepository {}

void main() {
  late HomeViewModel viewModel;
  late MockMotelRepository mockMotelRepository;

  setUp(() {
    mockMotelRepository = MockMotelRepository();
    viewModel = HomeViewModel(mockMotelRepository);
  });

  group('getAllMotels', () {
    test(
        'deve popular motelList e retornar um resultado de sucesso quando o repositório retorna uma lista de motéis',
        () async {
      final motels = [
        MotelModel(
          fantasyName: "Motel Paraíso Secreto",
          logo: "https://example.com/logo2.png",
          neighborhood: "Zona Sul",
          distance: 3.2,
          favoritesCount: 40,
          suites: [],
          reviewsCount: 60,
          rating: 4.9,
        ),
        MotelModel(
          fantasyName: "Motel Amor & Paixão",
          logo: "https://example.com/logo1.png",
          neighborhood: "Centro",
          distance: 1.5,
          favoritesCount: 25,
          suites: [],
          reviewsCount: 40,
          rating: 4.7,
        )
      ];

      when(() => mockMotelRepository.getAllMotels())
          .thenAnswer((_) async => motels);

      bool notified = false;
      viewModel.addListener(() {
        notified = true;
      });

      final result = await viewModel.getAllMotels();

      expect(result.isSuccess, isTrue);
      expect(result.data, equals(motels));
      expect(viewModel.motelList, equals(motels));
      expect(notified, isTrue);
    });

    test(
        'deve retornar um resultado de falha quando o repositório lança uma exceção',
        () async {
      when(() => mockMotelRepository.getAllMotels())
          .thenThrow(Exception('Erro'));

      final result = await viewModel.getAllMotels();

      expect(result.isSuccess, isFalse);
      expect(result.messageCode,
          equals("Nenhum motel encontrado. Verifique sua conexão"));
      expect(viewModel.motelList, isEmpty);
    });
  });

  group('getPopularMotels', () {
    test(
        'deve popular popularMotelList e retornar um resultado de sucesso quando o repositório retorna uma lista de motéis populares',
        () async {
      final popularMotels = [
        MotelModel(
          fantasyName: "Motel Paraíso Secreto",
          logo: "https://example.com/logo2.png",
          neighborhood: "Zona Sul",
          distance: 3.2,
          favoritesCount: 40,
          suites: [],
          reviewsCount: 60,
          rating: 4.9,
        ),
        MotelModel(
          fantasyName: "Motel Amor & Paixão",
          logo: "https://example.com/logo1.png",
          neighborhood: "Centro",
          distance: 1.5,
          favoritesCount: 25,
          suites: [],
          reviewsCount: 40,
          rating: 4.7,
        )
      ];

      // Quando o método getPopularMotels for chamado, retorne a lista de teste
      when(() => mockMotelRepository.getPopularMotels())
          .thenAnswer((_) async => popularMotels);

      // Variável para verificar se o notifyListeners foi chamado
      bool notified = false;
      viewModel.addListener(() {
        notified = true;
      });

      final result = await viewModel.getPopularMotels();

      expect(result.isSuccess, isTrue);
      expect(result.data, equals(popularMotels));
      expect(viewModel.popularMotelList, equals(popularMotels));
      expect(notified, isTrue);
    });

    test(
        'deve retornar um resultado de falha quando o repositório lança uma exceção ao buscar motéis populares',
        () async {
      when(() => mockMotelRepository.getPopularMotels())
          .thenThrow(Exception('Erro'));

      final result = await viewModel.getPopularMotels();

      expect(result.isSuccess, isFalse);
      expect(result.messageCode,
          equals("Nenhum motel encontrado. Verifique sua conexão"));
      expect(viewModel.popularMotelList, isEmpty);
    });
  });
}
