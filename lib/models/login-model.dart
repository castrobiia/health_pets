class LoginModel {
  final String email;
  final String password;
  final String device_token;

  LoginModel(this.email, this.password, this.device_token);

  LoginModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        device_token = json['device_token'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'device_token': device_token,
      };
  @override
  String toString() {
    return '{email: $email, password: $password, device_token: $device_token}';
  }
}
