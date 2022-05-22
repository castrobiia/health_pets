import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async' show Future;

class AnimalModel {
  int? id;
  String? nome;
  String? dataNascimento;
  int? idEspecie;
  int? idRaca;
  String? foto;

  AnimalModel(
      {this.id,
      this.nome,
      this.dataNascimento,
      this.idEspecie,
      this.idRaca,
      this.foto});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dataNascimento = json['data_nascimento'];
    idEspecie = json['id_especie'];
    idRaca = json['id_raca'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['data_nascimento'] = this.dataNascimento;
    data['id_especie'] = this.idEspecie;
    data['id_raca'] = this.idRaca;
    data['foto'] = this.foto;
    return data;
  }

  @override
  String toString() {
    return '{id: $id, nome: $nome, dataNascimento: $dataNascimento, idEspecie: $idEspecie, idRaca: $idRaca, foto: $foto}';
  }

  Future<String> _loadAnimal(String token) async {
    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    const url = 'https://www.healthpets.app.br/api/animal/';
    final response =
        await http.get(Uri.parse(url + id.toString()), headers: header);

    return response.body;
  }

  Future loadAnimal(String token) async {
    String jsonString = await _loadAnimal(token);
    final jsonResponse = json.decode(jsonString);
    AnimalModel animal = new AnimalModel.fromJson(jsonResponse);
    return animal;
  }
}
