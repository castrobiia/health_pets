class RacasModel {
  int? id;
  String? nome;
  int? idEspecie;

  RacasModel(
      {this.id,
      this.nome,
      this.idEspecie,
      });

  RacasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    idEspecie = json['id_especie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['id_especie'] = this.idEspecie;
    return data;
  }
}
