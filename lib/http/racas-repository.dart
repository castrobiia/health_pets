import 'package:dio/dio.dart';
import 'package:health_pets/models/raca-model.dart';

class RacasRepository {
  final dio = Dio();
  final url = "https://www.healthpets.app.br/api/raca";

  // Todo descomentar para voltar ao estado principal. Future<List<RacasModel>> fetchRacas() async {
  //   final response = await dio.get(url);
  //   final list = response.data as List;
  //
  //   List<RacasModel> racas = [];
  //   for (var json in list) {
  //     final raca = RacasModel.fromJson(json);
  //     racas.add(raca);
  //   }
  //   return racas;
  // }
}
