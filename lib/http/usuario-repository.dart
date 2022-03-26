import 'package:health_pets/models/usuario-model-teste.dart';
import 'package:http/http.dart' as http;

class UsuarioRepository {
  Future<UsuarioModelTeste?> submitUsuario(String name, String email,
      String password, String password_confirmation) async {
    const url = 'https://www.healthpets.app.br/api/auth/register';
    final response = await http.post(Uri.parse(url), body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    });
    var dadosUsuario = response.body;
    print('VENDO OS DADOS DO USUÁRIO ${dadosUsuario}');
  }
}
