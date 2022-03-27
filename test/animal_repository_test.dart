import 'package:flutter_test/flutter_test.dart';
import 'package:health_pets/http/animal-repository.dart';

main() {
  final repository = AnimalRepository();
  test('deve trazer uma lista de AnimalModel', () async {
    final list = await repository.fetchAnimais();
    print(list[0].nome);
  });
}
