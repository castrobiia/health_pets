class InfoModel {
  int? id;
  String? data;
  String? descricao;
  int? idCategoria;
  int? idSubcategoria;
  String? local;
  double? valor;
  int? idAnimal;

  InfoModel({this.id,
        this.data,
        this.descricao,
        this.idCategoria,
        this.idSubcategoria,
        this.local,
        this.valor,
        this.idAnimal,});

  InfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    descricao = json['descricao'];
    idCategoria = json['id_categoria'];
    idSubcategoria = json['id_subcategoria'];
    local = json['local'];
    valor = json['valor'];
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
    data['id_animal'] = this.idAnimal;
    return data;
  }
}