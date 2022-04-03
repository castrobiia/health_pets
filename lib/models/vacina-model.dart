class VacinaModel {
  int? id;
  String? nome;
  String? dataAplicacao;
  String? fabricante;
  String? lote;
  int? idAnimal;

  VacinaModel(
      {this.id,
      this.nome,
      this.dataAplicacao,
      this.fabricante,
      this.lote,
      this.idAnimal
      });

  VacinaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dataAplicacao = json['data_aplicacao'];
    fabricante = json['fabricante'];
    lote = json['lote'];
    idAnimal = json['id_animal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['data_aplicacao'] = this.dataAplicacao;
    data['fabricante'] = this.fabricante;
    data['lote'] = this.lote;
    data['id_animal'] = this.idAnimal;
    return data;
  }
}
