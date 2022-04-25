import 'package:health_pets/repositories/usuario-repository.dart';

class UsuarioController {
  final UsuarioRepository _repositoryUsuario;

  UsuarioController(this._repositoryUsuario);

  Future deleteUsuario() async {
    return _repositoryUsuario.deleteUsuario();
  }
}
