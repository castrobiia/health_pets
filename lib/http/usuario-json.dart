import 'package:health_pets/models/usuario-model.dart';

class UsuarioJson {
  String mensagem;
  Usuario usuario;
  String token;

  UsuarioJson(this.mensagem, this.usuario, this.token);

  UsuarioJson.fromJson(Map<String, dynamic> json)
      : mensagem = json['message'],
        usuario =
            (json['user'] != null ? new Usuario.fromJson(json['user']) : null)!,
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'message': mensagem,
        'user': usuario.toJson(),
        'token': token,
      };
}
