class LembreteModel {
  String? titulo;
  String? data;
  String? descricao;
  String? hora;

  LembreteModel({this.titulo, this.data, this.descricao, this.hora});

  LembreteModel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    data = json['data'];
    descricao = json['descricao'];
    hora = json['hora'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['data'] = this.data;
    data['descricao'] = this.descricao;
    data['hora'] = this.hora;
    return data;
  }
}
