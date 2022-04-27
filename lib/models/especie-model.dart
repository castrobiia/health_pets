class EspecieModel {
  int id;
  String nome;

  EspecieModel({
    required this.id,
    required this.nome,
  });

  //serialização
  factory EspecieModel.fromJson(Map<String, dynamic> json) =>
      EspecieModel(id: json["id"], nome: json["nome"]);

  //retornar o objeto
  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
      };

  @override
  String toString() {
    return '{id: $id, nome: $nome}';
  }
}
