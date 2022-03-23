class CadastroAnimalModel {
  final String nome;
  final String data_nascimento;
  final String id_especie;
  final String id_raca;

  CadastroAnimalModel(
      this.nome, this.data_nascimento, this.id_especie, this.id_raca);

  CadastroAnimalModel.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        data_nascimento = json['data_nascimento'],
        id_especie = json['id_especie'],
        id_raca = json['id_raca'];

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'data_nascimento': data_nascimento,
        'id_especie': id_especie,
        'id_raca': id_raca
      };

  @override
  String toString() {
    return '{nome: $nome, data_nascimento: $data_nascimento, id_especie: $id_especie, id_raca: $id_raca}';
  }
}
