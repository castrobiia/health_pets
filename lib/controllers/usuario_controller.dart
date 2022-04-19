import 'package:health_pets/repository/usuario-repository.dart';

class UsuarioController {
  final UsuarioRepository _repositoryUsuario;

  UsuarioController(this._repositoryUsuario);

  Future deleteUsuario() async {
    return _repositoryUsuario.deleteUsuario();
  }
}
