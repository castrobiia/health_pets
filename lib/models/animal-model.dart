class AnimalModel {
  final int? id;
  final String? nome;
  final String? dataNascimento;
  final int? idEspecie;
  final int? idRaca;
  final String? foto;

  AnimalModel({
      this.id,
      this.nome,
      this.dataNascimento,
      this.idEspecie,
      this.idRaca,
      this.foto});

  AnimalModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    nome = json['nome'],
    dataNascimento = json['data_nascimento'],
    idEspecie = json['id_especie'],
    idRaca = json['id_raca'],
    foto = json['foto'];


  Map<String, dynamic> toJson() => {
    'id' : this.id,
    'nome' : this.nome,
    'data_nascimento' : this.dataNascimento,
    'id_especie' : this.idEspecie,
    'id_raca' : this.idRaca,
    'foto' : this.foto
  };

  @override
  String toString(){
    return '{id: $id, nome: $nome, dataNascimento: $dataNascimento, idEspecie: $idEspecie, idRaca: $idRaca, foto: $foto}';
  }
}
