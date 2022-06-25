class InfoModel {
  int? id;
  String? data;
  String? descricao;
  int? idCategoria;
  int? idSubcategoria;
  String? local;
  String? valor;
  String? hora;
  String? alerta;
  int? idAnimal;

  @override
  toString() {
    return 'id: $id, data: $data, descricao: $descricao, idAnimal: $idAnimal, idCategoria: $idCategoria, idSubcategoria: $idSubcategoria, local: $local, valor: $valor, alerta: $alerta';
  }

  InfoModel({
    this.id,
    this.data,
    this.descricao,
    this.idCategoria,
    this.idSubcategoria,
    this.local,
    this.valor,
    this.hora,
    this.alerta,
    this.idAnimal,
  });

  InfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    descricao = json['descricao'];
    idCategoria = json['id_categoria'];
    idSubcategoria = json['id_subcategoria'];
    local = json['local'];
    valor = json['valor'];
    hora = json['hora'];
    alerta = json['alerta'];
    idAnimal = json['id_animal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['descricao'] = this.descricao;
    data['id_categoria'] = this.idCategoria;
    data['id_subcategoria'] = this.idSubcategoria;
    data['local'] = this.local;
    data['valor'] = this.valor;
    data['hora'] = this.hora;
    data['alerta'] = this.alerta;
    data['id_animal'] = this.idAnimal;
    return data;
  }

  @override
  bool operator ==(Object other) {
    other is InfoModel && other.id == id && other.idAnimal == idAnimal;
    return super == other;
  }
}
