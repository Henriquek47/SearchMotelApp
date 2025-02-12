import 'package:guia_motel/models/response/motel_model.dart';

abstract class MotelRepositoryInterface {
  Future<List<MotelModel>> getAllMotels();
  Future<List<MotelModel>> getPopularMotels();
}