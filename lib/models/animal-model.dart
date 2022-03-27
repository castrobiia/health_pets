class AnimalModel {
  int? id;
  String? nome;
  String? dataNascimento;
  int? idEspecie;
  Null? idRaca;
  int? foto;

  AnimalModel(
      {this.id,
      this.nome,
      this.dataNascimento,
      this.idEspecie,
      this.idRaca,
      this.foto});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dataNascimento = json['data_nascimento'];
    idEspecie = json['id_especie'];
    idRaca = json['id_raca'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['data_nascimento'] = this.dataNascimento;
    data['id_especie'] = this.idEspecie;
    data['id_raca'] = this.idRaca;
    data['foto'] = this.foto;
    return data;
  }
}
