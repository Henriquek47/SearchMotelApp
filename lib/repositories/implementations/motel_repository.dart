import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guia_motel/core/constants/endpoints.dart';
import 'package:guia_motel/models/response/motel_model.dart';
import 'package:guia_motel/repositories/interfaces/motel_repository_interface.dart';
import 'package:guia_motel/services/http/api_client.dart';

class MotelRepository extends ChangeNotifier
    implements MotelRepositoryInterface {
  final ApiClient _apiClient;

  MotelRepository(this._apiClient);

  @override
  Future<List<MotelModel>> getAllMotels() async {
    List<MotelModel> motels = [];

    try {
      final response = await _apiClient.getData(Endpoints.getAllMotels);
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      for (var e in body['data']['moteis']) {
        motels.add(MotelModel.fromJson(e));
      }
      return motels;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MotelModel>> getPopularMotels() async {
    try {
      final list = await getAllMotels();

      list.sort((a, b) {
        if (b.rating == a.rating) {
          return b.reviewsCount.compareTo(a.reviewsCount);
        }
        return b.rating.compareTo(a.rating);
      });

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
