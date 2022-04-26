import 'package:flutter_test/flutter_test.dart';
import 'package:health_pets/http/raca-repository.dart';

main() {
  final repository = RacasRepository();
  test('deve trazer uma lista de RacasModel', () async {
    final list = await repository.fetchRacas();
    // print(list[0].descricao);
  });
}
