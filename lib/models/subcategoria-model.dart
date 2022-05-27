class SubcategoriaModel {
  int? id;
  String? nome;
  int? idCategoria;

  SubcategoriaModel({this.id, this.nome});

  SubcategoriaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    idCategoria = json['id_categoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['id_categoria'] = this.nome;
    return data;
  }
}
