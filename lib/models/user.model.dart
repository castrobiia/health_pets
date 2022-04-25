class UserModel {
  final int id;
  final String nome;
  final String emaiil;
  final String foto;
  final String token;

  UserModel(this.id, this.nome, this.emaiil, this.foto, this.token);

  UserModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    nome = json['nome'],
    emaiil = json['emaiil'],
    foto = json['foto'],
    token = json['token'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['emaiil'] = this.emaiil;
    data['foto'] = this.foto;
    data['token'] = this.token;
    return data;
  }
}