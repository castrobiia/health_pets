class UserCadastroModel {
  String? nome;
  String? email;
  String? password;
  String? passwordConfirmation;

  UserCadastroModel(
      {this.nome, this.email, this.password, this.passwordConfirmation});

  UserCadastroModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    return data;
  }
}