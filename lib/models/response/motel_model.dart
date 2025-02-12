import 'package:guia_motel/models/response/suite_model.dart';

class MotelModel {
  final String fantasyName;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favoritesCount;
  final List<SuiteModel> suites;
  final int reviewsCount;
  final double rating;

  MotelModel({
    required this.fantasyName,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favoritesCount,
    required this.suites,
    required this.reviewsCount,
    required this.rating,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) {
    return MotelModel(
      fantasyName: json['fantasia'] ?? '',
      logo: json['logo'] ?? '',
      neighborhood: json['bairro'] ?? '',
      distance: (json['distancia'] ?? 0).toDouble(),
      favoritesCount: json['qtdFavoritos'] ?? 0,
      suites: (json['suites'] as List<dynamic>?)
              ?.map((e) => SuiteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reviewsCount: json['qtdAvaliacoes'] ?? 0,
      rating: (json['media'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fantasia': fantasyName,
      'logo': logo,
      'bairro': neighborhood,
      'distancia': distance,
      'qtdFavoritos': favoritesCount,
      'suites': suites.map((s) => s.toJson()).toList(),
      'qtdAvaliacoes': reviewsCount,
      'media': rating,
    };
  }
}
