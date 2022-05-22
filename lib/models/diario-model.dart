class DiarioModel {
  int? id;
  String? titulo;
  int? idAnimal;
  String? data;
  String? humor;
  int? peso;
  String? descricao;

  DiarioModel(
      {this.id,
      this.titulo,
      this.idAnimal,
      this.data,
      this.humor,
      this.peso,
      this.descricao});

  DiarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    idAnimal = json['id_animal'];
    data = json['data'];
    humor = json['humor'];
    peso = json['peso'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['data'] = this.data;
    data['id_animal'] = this.idAnimal;
    data['humor'] = this.humor;
    data['peso'] = this.peso;
    data['descricao'] = this.descricao;
    return data;
  }
}
