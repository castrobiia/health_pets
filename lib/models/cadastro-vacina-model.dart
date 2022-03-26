class CadastroVacinaModel {
  final String nome;
  final String data_aplicacao;
  final fabricante;
  final lote;
  final id_especie;

  CadastroVacinaModel(this.nome, this.data_aplicacao, this.fabricante,
      this.lote, this.id_especie);

  CadastroVacinaModel.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        data_aplicacao = json['data_aplicacao'],
        fabricante = json['fabricante'],
        lote = json['lote'],
        id_especie = json['id_especie'];

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'data_aplicacao': data_aplicacao,
        'fabricante': fabricante,
        'lote': lote,
        'id_especie': id_especie
      };

  @override
  String toString() {
    return '{nome vacina: $nome, data_aplicacao: $data_aplicacao, fabricante: $fabricante, lote: $lote, id_especie: $id_especie}';
  }
}
