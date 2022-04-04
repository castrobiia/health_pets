class CadastroVacinaModel {
  final String nome;
  final String data_aplicacao;
  final String fabricante;
  final String lote;
  final int id_animal;

  CadastroVacinaModel(this.nome, this.data_aplicacao, this.fabricante,
      this.lote, this.id_animal);

  CadastroVacinaModel.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        data_aplicacao = json['data_aplicacao'],
        fabricante = json['fabricante'],
        lote = json['lote'],
        id_animal = json['id_animal'];

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'data_aplicacao': data_aplicacao,
        'fabricante': fabricante,
        'lote': lote,
        'id_animal': id_animal
      };

  @override
  String toString() {
    return '{nome vacina: $nome, data_aplicacao: $data_aplicacao, fabricante: $fabricante, lote: $lote, id_animal: $id_animal}';
  }
}
