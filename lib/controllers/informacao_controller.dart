import 'package:health_pets/repository/informacao-repository.dart';

class InformacaoController {
  final InformacaoRepository _informacaoRepository;

  InformacaoController(this._informacaoRepository);

  Future<String> deleteInfo(id) async {
    return _informacaoRepository.deleteInformacao(id);
  }
}
