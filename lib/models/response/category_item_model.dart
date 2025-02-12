// lib/models/categoria_item_model.dart

class CategoryItemModel {
  final String name;
  final String icon;

  CategoryItemModel({
    required this.name,
    required this.icon,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
      name: json['nome'] ?? '',
      icon: json['icone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'icone': icon,
    };
  }
}
