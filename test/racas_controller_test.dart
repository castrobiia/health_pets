import 'package:flutter_test/flutter_test.dart';
import 'package:health_pets/controllers/racas_controller.dart';
import 'package:health_pets/http/racas-repository.dart';

main() {
  final repository = RacasRepository();
  final controller = RacasController(repository);

  test('deve preencher variavel racas', () async {
    //when(repository.fetchRacas()).thenAnswer((_) async => RacasModel());

    expect(controller.state, RacaState.start);
    await controller.start();
    expect(controller.state, RacaState.success);
    expect(controller.racas.isNotEmpty, true);
  });

  test('deve modificar o estado para error se a requisição falhar', () async {
    //when(repository.fetchRacas()).thenTrow(Exception());

    expect(controller.state, RacaState.start);
    await controller.start();
    expect(controller.state, RacaState.error);
  });
}
