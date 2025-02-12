
class DiscountModel {
  final double discount;

  DiscountModel({required this.discount});

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      discount: (json['desconto'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desconto': discount,
    };
  }
}
