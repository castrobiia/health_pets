class EspecieModel {
  int id;
  String descricao;

  EspecieModel({
    required this.id,
    required this.descricao,
  });

  //serialização
  factory EspecieModel.fromJson(Map<String, dynamic> json) =>
      EspecieModel(id: json["id"], descricao: json["descricao"]);

  //retornar o objeto
  Map<String, dynamic> toJson() => {
        'id': id,
        'descricao': descricao,
      };

  @override
  String toString() {
    return '{id: $id, descricao: $descricao}';
  }
}
