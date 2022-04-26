import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async' show Future;

class AnimalModel {
  late final int id;
  late final String nome;
  late final String dataNascimento;
  late final int idEspecie;
  late final int idRaca;
  late final String foto;

  AnimalModel(){}

  AnimalModel.withParams(id,nome,dataNascimento,idEspecie, idRaca, foto) {
    this.id = id;
    this.nome = nome;
    this.dataNascimento = dataNascimento;
    this.idEspecie = idEspecie;
    this.idRaca= idRaca;
    this.foto = foto;
  }

  AnimalModel.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        nome = json['nome'],
        dataNascimento = json['data_nascimento'],
        idEspecie = json['id_especie'],
        idRaca = json['id_raca'],
        foto = json['foto'];


  Map<String, dynamic> toJson() => {
    'id' : this.id,
    'nome' : this.nome,
    'data_nascimento' : this.dataNascimento,
    'id_especie' : this.idEspecie,
    'id_raca' : this.idRaca,
    'foto' : this.foto
  };

  @override
  String toString(){
    return '{id: $id, nome: $nome, dataNascimento: $dataNascimento, idEspecie: $idEspecie, idRaca: $idRaca, foto: $foto}';
  }

  Future<String> _loadAnimal(String token) async {
    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    const url = 'https://www.healthpets.app.br/api/animal/';
    final response = await http.get(Uri.parse(url+id.toString()), headers: header);

    return response.body;
  }

  Future loadAnimal(String token) async {
    String jsonString = await _loadAnimal(token);
    final jsonResponse = json.decode(jsonString);
    AnimalModel animal = new AnimalModel.fromJson(jsonResponse);
    return animal;
  }
}
