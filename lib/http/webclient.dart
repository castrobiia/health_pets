import 'dart:convert';
import 'package:health_pets/models/animal-model.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("Request");
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("Response");
    print('status code: ${data.statusCode}');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

class RepositoryEspecie {
  Future<List<EspecieModel>> findAllEspecies() async {
    final Client client = InterceptedClient.build(
      interceptors: [
        LoggingInterceptor(),
      ],
    );

    const url = 'https://www.healthpets.app.br/api/especie';
    final response = await client.get(Uri.parse(url));
    var titulo = jsonDecode(response.body);

    //decodificando o json
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<EspecieModel> especies = [];

    return decodedJson.map((json) => EspecieModel.fromJson(json)).toList();
  }
}

class RepositoryAnimal {
  Future<List> findAllAnimais() async {
    final Client client = InterceptedClient.build(
      interceptors: [
        LoggingInterceptor(),
      ],
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    const url = 'https://www.healthpets.app.br/api/animal';
    final response = await client.get(Uri.parse(url), headers: header);
    var titulo = jsonDecode(response.body);

    //decodificando o json
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<AnimalModel> animais = [];

    print("TESTE RETURN ANIMAL");
    print(decodedJson.map((json) => AnimalModel.fromJson(json).toString()));
    return decodedJson.map((json) => AnimalModel.fromJson(json)).toList();
  }

  Future<AnimalModel> getAnimal(int id) async {
    // Future<void> getAnimal(int id) async {
    final Client client = InterceptedClient.build(
      interceptors: [
        LoggingInterceptor(),
      ],
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    // AnimalModel.loadAnimal();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    const url = 'https://www.healthpets.app.br/api/animal/';
    final response =
        await client.get(Uri.parse(url + id.toString()), headers: header);
    var titulo = jsonDecode(response.body);

    final Listanimal;

    final List<dynamic> decodedJson = jsonDecode(response.body);
    final Map<String, dynamic> map = json.decode(response.body);
    final List<AnimalModel> animais = [];
    AnimalModel animal = new AnimalModel.fromJson(jsonDecode(response.body));

    return animal;
  }
}
