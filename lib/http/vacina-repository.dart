import 'package:dio/dio.dart';
import 'package:health_pets/models/vacina-model.dart';

class VacinaRepository {
  final dio = Dio();
  final url = "https://www.healthpets.app.br/api/vacina";

  Future<List<VacinaModel>> fetchVacina() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<VacinaModel> vacinas = [];
    for (var json in list) {
      final vacina = VacinaModel.fromJson(json);
      vacinas.add(vacina);
    }
    return vacinas;
  }
}
