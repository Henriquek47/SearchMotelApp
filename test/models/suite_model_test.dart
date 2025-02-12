import 'package:flutter_test/flutter_test.dart';
import 'package:guia_motel/models/response/discount_model.dart';
import 'package:guia_motel/models/response/suite_model.dart';
import 'package:guia_motel/models/response/category_item_model.dart';
import 'package:guia_motel/models/response/item_suite_model.dart';
import 'package:guia_motel/models/response/period_model.dart';

void main() {
  group('SuiteModel Tests', () {
    test('SuiteModel.fromJson() deve criar objeto a partir de JSON válido', () {
      final json = {
        'nome': 'Suíte Teste',
        'qtd': 2,
        'exibirQtdDisponiveis': true,
        'fotos': ['foto1.jpg', 'foto2.jpg'],
        'itens': [
          {'nome': 'Banheira dupla'},
          {'nome': 'Cama redonda'}
        ],
        'categoriaItens': [
          {
            'nome': 'Frigobar',
            'icone': 'frigobar.png',
          },
          {
            'nome': 'Ar Condicionado',
            'icone': 'ar.png',
          }
        ],
        'periodos': [
          {
            'tempoFormatado': '2 horas',
            'tempo': '2',
            'valor': 50.0,
            'totalValue': 50.0,
            'temCortesia': false,
            'desconto': {"desconto": 8.0},
          },
        ],
      };

      final suite = SuiteModel.fromJson(json);

      expect(suite.name, 'Suíte Teste');
      expect(suite.amount, 2);
      expect(suite.showAvailableQuantity, true);
      expect(suite.photos, ['foto1.jpg', 'foto2.jpg']);
      expect(suite.items.length, 2);
      expect(suite.items.first, isA<SuiteItemModel>());
      expect(suite.categoryItems.length, 2);
      expect(suite.categoryItems.first, isA<CategoryItemModel>());
      expect(suite.periods.length, 1);
      expect(suite.periods.first, isA<PeriodModel>());
      expect(suite.periods.first.formattedTime, '2 horas');
    });

    test(
        'SuiteModel.toJson() deve converter corretamente para Map<String, dynamic>',
        () {
      final suiteModel = SuiteModel(
        name: 'Suíte Teste',
        amount: 2,
        showAvailableQuantity: true,
        photos: ['foto1.jpg', 'foto2.jpg'],
        items: [
          SuiteItemModel(name: 'Banheira dupla'),
          SuiteItemModel(name: 'Cama redonda'),
        ],
        categoryItems: [
          CategoryItemModel(name: 'Frigobar', icon: 'frigobar.png'),
          CategoryItemModel(name: 'Ar Condicionado', icon: 'ar.png'),
        ],
        periods: [
          PeriodModel(
            formattedTime: '2 horas',
            time: '2',
            value: 50.0,
            totalValue: 50.0,
            hasCourtesy: false,
            discount: DiscountModel(discount: 8.0),
          )
        ],
      );

      final json = suiteModel.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['nome'], 'Suíte Teste');
      expect(json['qtd'], 2);
      expect(json['exibirQtdDisponiveis'], true);
      expect(json['fotos'], ['foto1.jpg', 'foto2.jpg']);

      expect(json['itens'], isA<List>());
      expect(json['itens'].length, 2);
      expect(json['itens'].first['nome'], 'Banheira dupla');

      expect(json['categoriaItens'], isA<List>());
      expect(json['categoriaItens'].length, 2);
      expect(json['categoriaItens'].first['nome'], 'Frigobar');
      expect(json['categoriaItens'].first['icone'], 'frigobar.png');

      expect(json['periodos'], isA<List>());
      expect(json['periodos'].length, 1);
      expect(json['periodos'].first['tempoFormatado'], '2 horas');
      expect(json['periodos'].first['valor'], 50.0);

      expect(json['periodos'].first['desconto']["desconto"], 8.0);
    });
  });
}
