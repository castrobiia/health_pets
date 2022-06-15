import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UsuarioRepository {
  var url = 'https://www.healthpets.app.br/api/auth';

  getUsuario() async {
    //excluir quando resolver o erro: Unauthenticated
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };
    //usar Header().getHeader();, entender a mensagem de erro message: Unauthenticated.
    final response = await http.get(Uri.parse(url + '/me'), headers: header);
    dynamic usuario = jsonDecode(response.body);

    return usuario;
  }

  deleteUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var response =
        await http.delete(Uri.parse(url + '/delete'), headers: header);
    var usuario = jsonDecode(response.body);
    var mensagem = usuario['message'];

    return mensagem;
  }

  putUsuario(String id, String nome, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var body = jsonEncode({
      'nome': nome,
      'email': email,
    });

    var response = await http.put(
        Uri.parse('https://healthpets.app.br/api/user/${id}'),
        body: body,
        headers: header);
    return jsonDecode(response.statusCode.toString());
  }

  alterarSenha(String id, String senha, String confirmacaoSenha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var usuario = await getUsuario();
    var nome = usuario['user']['nome'];
    var email = usuario['user']['email'];

    var body = jsonEncode({
      'nome': nome,
      'email': email,
      'password': senha,
      'password_confirmation': confirmacaoSenha,
    });

    var response = await http.put(
        Uri.parse('https://healthpets.app.br/api/user/${id}'),
        body: body,
        headers: header);

    return jsonDecode(response.statusCode.toString());
  }
}
