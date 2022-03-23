import 'dart:async';

class EspecieModel {
  final int id;
  final String descricao;
  final String id_template;

  EspecieModel(
    this.id,
    this.descricao,
    this.id_template,
  );

  //serialização
  EspecieModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        descricao = json["descricao"],
        id_template = json["id_template"];

  //retornar o objeto
  Map<String, dynamic> toJson() => {
        'id': id,
        'descricao': descricao,
        'id_template': id_template,
      };

  @override
  String toString() {
    return '{id: $id, descricao: $descricao, id_template: $id_template}';
  }
}
