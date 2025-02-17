import 'package:flutter/material.dart';
import 'package:guia_motel/core/helper/result_pattern.dart';
import 'package:guia_motel/models/response/motel_model.dart';
import 'package:guia_motel/repositories/implementations/motel_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final MotelRepository motelRepository;

  HomeViewModel(this.motelRepository);

  final List<MotelModel> motelList = [];
  final List<MotelModel> popularMotelList = [];
  bool loadingPopular = false;
  bool loadingAllMotels = false;

  Future<Result> getAllMotels() async {
    try {
      loadingAllMotels = true;
      notifyListeners();
      final list = await motelRepository.getAllMotels();
      motelList.addAll(list);
      loadingAllMotels = false;
      notifyListeners();
      return Result.success(data: motelList);
    } catch (e) {
      loadingAllMotels = false;
      notifyListeners();
      return Result.failure(
          messageCode: "Nenhum motel encontrado. Verifique sua conexão");
    }
  }

  Future<Result> getPopularMotels() async {
    try {
      loadingPopular = true;
      notifyListeners();
      final list = await motelRepository.getPopularMotels();
      popularMotelList.addAll(list);
      loadingPopular = false;
      notifyListeners();
      return Result.success(data: popularMotelList);
    } catch (e) {
      loadingPopular = false;
      notifyListeners();
      return Result.failure(
          messageCode: "Nenhum motel encontrado. Verifique sua conexão");
    }
  }
}
