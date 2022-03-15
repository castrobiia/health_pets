class Usuario {
  final String nome;
  final String email;
  final String atualizado;
  final String criado;
  final int id;

  Usuario(this.nome, this.email, this.atualizado, this.criado, this.id);

  Usuario.fromJson(Map<String, dynamic> json)
      : nome = json['name'],
        email = json['email'],
        atualizado = json['updated_at'],
        criado = json['created_at'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'name': nome,
        'email': email,
        'updated_at': atualizado,
        'created_at': criado,
        'id': id,
      };
  @override
  String toString() {
    return '{name: $nome, email: $email, updated_at: $atualizado, created_at: $criado, id: $id}';
  }
}
