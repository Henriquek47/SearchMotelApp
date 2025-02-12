import 'package:flutter_test/flutter_test.dart';
import 'package:guia_motel/models/response/motel_model.dart';
import 'package:guia_motel/models/response/suite_model.dart';

void main() {
  test(
      'MotelModel.toJson() deve converter corretamente para Map<String, dynamic>',
      () {
    final model = MotelModel(
      fantasyName: 'Motel Mar',
      logo: 'Logo',
      neighborhood: 'Bairro',
      distance: 10.0,
      favoritesCount: 5,
      suites: [
        SuiteModel(
            name: "Suite Master",
            amount: 0,
            showAvailableQuantity: false,
            photos: [],
            items: [],
            categoryItems: [],
            periods: [])
      ],
      reviewsCount: 100,
      rating: 4.5,
    );

    final json = model.toJson();

    expect(json, isA<Map<String, dynamic>>());
    expect(json['fantasia'], 'Motel Mar');
    expect(json['logo'], 'Logo');
    expect(json['bairro'], 'Bairro');
    expect(json['distancia'], 10.0);
    expect(json['qtdFavoritos'], 5);
    expect(json['suites'], isNotEmpty);
    expect(json['qtdAvaliacoes'], 100);
    expect(json['media'], 4.5);
  });
}
