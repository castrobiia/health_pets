import 'package:flutter_test/flutter_test.dart';
import 'package:health_pets/controllers/especie_controller.dart';
import 'package:health_pets/http/webclient.dart';
import 'package:health_pets/models/especie-model.dart';

main() {
  final repository = RepositoryEspecie();
  final controller = EspecieController();
  /* 
  test('deve preencher variavel especies', () async {
    when(repository.findAllEspecies())
        .thenAnswer((_) async => [EspecieModel(1, 'Gato', 'null')]);

    expect(controller.state, EspecieState.start);
    await controller.start();
    expect(controller.state, EspecieState.success);
    expect(controller.especies.isNotEmpty, true);
  });

  

  test('deve modificar o estado para error se a requisição falhar', () async {
    when(repository.findAllEspecies()).thenThrow(Exception());

    expect(controller.state, EspecieState.start);
    await controller.start();
    expect(controller.state, EspecieState.success);
    expect(controller.especies.isNotEmpty, true);
  });
  */
}
