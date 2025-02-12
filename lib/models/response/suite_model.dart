// lib/models/suite_model.dart

import 'package:guia_motel/models/response/category_item_model.dart';
import 'package:guia_motel/models/response/item_suite_model.dart';
import 'package:guia_motel/models/response/period_model.dart';

class SuiteModel {
  final String name;
  final int amount;
  final bool showAvailableQuantity;
  final List<String> photos;
  final List<SuiteItemModel> items;
  final List<CategoryItemModel> categoryItems;
  final List<PeriodModel> periods;

  SuiteModel({
    required this.name,
    required this.amount,
    required this.showAvailableQuantity,
    required this.photos,
    required this.items,
    required this.categoryItems,
    required this.periods,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) {
    return SuiteModel(
      name: json['nome'] ?? '',
      amount: json['qtd'] ?? 0,
      showAvailableQuantity: json['exibirQtdDisponiveis'] ?? false,
      photos: (json['fotos'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      items: (json['itens'] as List<dynamic>?)
              ?.map((e) => SuiteItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      categoryItems: (json['categoriaItens'] as List<dynamic>?)
              ?.map(
                  (e) => CategoryItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      periods: (json['periodos'] as List<dynamic>?)
              ?.map((e) => PeriodModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'qtd': amount,
      'exibirQtdDisponiveis': showAvailableQuantity,
      'fotos': photos,
      'itens': items.map((item) => item.toJson()).toList(),
      'categoriaItens': categoryItems.map((cat) => cat.toJson()).toList(),
      'periodos': periods.map((p) => p.toJson()).toList(),
    };
  }
}
