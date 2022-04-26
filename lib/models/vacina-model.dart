class VacinaModel {
  int? idVacina;
  String? nomeVacina;
  String? dataAplicacao;
  String? fabricante;
  String? lote;
  int? idAnimal;

  VacinaModel(
      {this.idVacina,
      this.nomeVacina,
      this.dataAplicacao,
      this.fabricante,
      this.lote,
      this.idAnimal
      });

  VacinaModel.fromJson(Map<String, dynamic> json) {
    idVacina = json['id_vacina'];
    nomeVacina = json['nome_vacina'];
    dataAplicacao = json['data_aplicacao'];
    fabricante = json['fabricante'];
    lote = json['lote'];
    idAnimal = json['id_animal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_vacina'] = this.idVacina;
    data['nome_vacina'] = this.nomeVacina;
    data['data_aplicacao'] = this.dataAplicacao;
    data['fabricante'] = this.fabricante;
    data['lote'] = this.lote;
    data['id_animal'] = this.idAnimal;
    return data;
  }
}
