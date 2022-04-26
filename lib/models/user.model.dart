class UserModel {
  late int? id;
  late String? nome;
  late String? email;
  late String? foto;
  late String? token;

  UserModel(){}
  UserModel.withParams({this.id, this.nome, this.email, this.foto, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    foto = json['foto'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['emaiil'] = this.email;
    data['foto'] = this.foto;
    data['token'] = this.token;
    return data;
  }
}