
class SuiteItemModel {
  final String name;

  SuiteItemModel({
    required this.name,
  });

  factory SuiteItemModel.fromJson(Map<String, dynamic> json) {
    return SuiteItemModel(
      name: json['nome'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
    };
  }
}
