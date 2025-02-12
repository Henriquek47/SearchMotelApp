
import 'package:guia_motel/models/response/discount_model.dart';

class PeriodModel {
  final String formattedTime;
  final String time;
  final double value;
  final double totalValue;
  final bool hasCourtesy;
  final DiscountModel? discount;

  PeriodModel({
    required this.formattedTime,
    required this.time,
    required this.value,
    required this.totalValue,
    required this.hasCourtesy,
    this.discount,
  });

  factory PeriodModel.fromJson(Map<String, dynamic> json) {
    return PeriodModel(
      formattedTime: json['tempoFormatado'] ?? '',
      time: json['tempo'] ?? '',
      value: (json['valor'] ?? 0).toDouble(),
      totalValue: (json['valorTotal'] ?? 0).toDouble(),
      hasCourtesy: json['temCortesia'] ?? false,
      discount: json['desconto'] != null
          ? DiscountModel.fromJson(json['desconto'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tempoFormatado': formattedTime,
      'tempo': time,
      'valor': value,
      'valorTotal': totalValue,
      'temCortesia': hasCourtesy,
      'desconto': discount?.toJson(),
    };
  }
}
