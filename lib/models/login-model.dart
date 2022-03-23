class LoginModel {
  final String email;
  final String password;

  LoginModel(this.email, this.password);

  LoginModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
  @override
  String toString() {
    return '{email: $email, password: $password}';
  }
}
