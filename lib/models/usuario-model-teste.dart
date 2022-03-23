class UsuarioModelTeste {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;

  UsuarioModelTeste(
      this.name, this.email, this.password, this.password_confirmation);

  UsuarioModelTeste.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        password_confirmation = json['password_confirmation'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
      };
  @override
  String toString() {
    return '{name: $name, email: $email, password: $password, passoword_confirmation: $password_confirmation}';
  }
}
